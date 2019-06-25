package cn.own.mhics.controller;

import java.io.IOException;
import java.net.UnknownHostException;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import cn.own.mhics.common.VerifyCodeUtils;
import cn.own.mhics.entity.Person;
import cn.own.mhics.service.PersonService;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	@Autowired
	private PersonService personService;
	
	public static final String CAPTCHA_KEY = "session_captcha";
	
	@RequestMapping(value="/tologin",method=RequestMethod.GET)
	public String toLogin() {
		
		return "user/login";
	}
	
	
	
	@RequestMapping(value="logins",method = RequestMethod.POST)
	public String logins(HttpSession session,HttpServletRequest req,Model model) throws UnknownHostException {
		String userAccount = req.getParameter("userAccount").trim();
		String userPass = req.getParameter("userPass").trim();
		String ca=req.getParameter("code").toLowerCase();
		String sesionCode = (String) req.getSession().getAttribute(CAPTCHA_KEY);
		model.addAttribute("userAccount", userAccount);
		if(!ca.equals(sesionCode.toLowerCase())){
			System.out.println("验证码输入错误!");
			model.addAttribute("errormess", "验证码输入错误!");
			req.setAttribute("errormess","验证码输入错误!");
			return "user/login";
		}
		Person person = personService.findUserByAccountAndPass(userAccount,userPass);
		if(Objects.isNull("查到的用户信息:"+person)) {
			System.out.println("用户的信息："+person);
			model.addAttribute("errormess","账号或密码有误");
			return "user/login";
		}
		/*
		 * System.out.println("查到用户锁id为"+person.getIsLock()); if(person.getIsLock()==1)
		 * { model.addAttribute("errormess","该账号已被冻结"); return "user/login"; }
		 */
		Object sessionId=session.getAttribute("userId");
		if(sessionId==person.getUserId()) {
			model.addAttribute("hasmess","该账号已经登录，不能重复登录");
			session.setAttribute("thisperson",person);
			return "user/login";
		}
		else {
			session.setAttribute("userId",person.getUserId());
			//新增登录记录
		}
		return "redirect:/index/toindex";
	}
	
	@RequestMapping("handlehas")
	public String handleHas(HttpSession session){
		if(!StringUtils.isEmpty(session.getAttribute("thisuser"))){
			Person user=(Person) session.getAttribute("thisuser");
			System.out.println(user);
			session.removeAttribute("userId");
			session.setAttribute("userId", user.getUserId());
		}else{
			System.out.println("有问题！");
			return "login/login";
		}
		return "redirect:/index/toindex";
	}
	
	
	@RequestMapping(value="/loginout")
	public String loginOut(HttpSession session) {
		session.removeAttribute("userId");
		System.out.println("用户退出");
		return "user/login";
	}
	
	@RequestMapping(value="/captcha")
	public void captcha(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException{
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");

		// 生成随机字串
		String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
		
		// 生成图片
		int w = 135, h = 40;
		VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);

		// 将验证码存储在session以便登录时校验
		session.setAttribute(CAPTCHA_KEY, verifyCode.toLowerCase());
	}
	
}
