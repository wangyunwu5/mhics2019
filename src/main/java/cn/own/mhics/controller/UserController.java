package cn.own.mhics.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.own.mhics.entity.Dept;
import cn.own.mhics.entity.Position;
import cn.own.mhics.entity.Role;
import cn.own.mhics.entity.Person;
import cn.own.mhics.entity.UserRole;
import cn.own.mhics.service.DeptService;
import cn.own.mhics.service.PositionService;
import cn.own.mhics.service.RoleService;
import cn.own.mhics.service.UserRoleService;
import cn.own.mhics.service.PersonService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	private  PersonService userService;
	@Autowired
	private DeptService deptService;
	@Autowired
	private PositionService positionService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private UserRoleService urService;
	
	@RequestMapping(value="/usermanage")
	public String userManage(HttpServletRequest req,Model model) {
		userService.getAllUser(req);
		return "user/usermanage";
	}
	@RequestMapping(value="/useredit",method =RequestMethod.GET)
	public String userEdit(@RequestParam(value="userid",required=false)Long userid,Model model) {
		if(userid !=null) {
			Person user = userService.getOneUser(userid);
			Role userrole = userService.getUserRole(userid);
			model.addAttribute("user",user);
			model.addAttribute("urole",userrole);
			model.addAttribute("exituserid","yes");
		}
		List<Dept> depts = deptService.findAllDept();
		List<Position> positions = positionService.findAllPosition();
		List<Role> roles = roleService.findAllRole();
		model.addAttribute("depts",depts);
		model.addAttribute("positions",positions);
		model.addAttribute("roles",roles);
		return "user/edituser";
	}
	
	@RequestMapping(value="/usereditend",method =RequestMethod.POST)
	public String userEditSave(Person user,int roleId,int deptId,Long positionId,@RequestParam(value = "resetpassword",required=false) boolean resetpassword,
			Model model) {
		Long userid= user.getUserId();
		if(userid==null) { 
			Dept dept = deptService.findOne(deptId);
			Position po = positionService.findOne(positionId);
			user.setUserPass("123456");
			user.setDept(dept);
			user.setPosition(po);
			System.out.println("用户的入职时间为："+user.getHireDate());
			userService.save(user);
			Person user1=userService.getOneByAccount(user.getUserAccount());
			UserRole ur1 =new UserRole(); 
			ur1.setRoleId(roleId);
			ur1.setUserId(user1.getUserId());
			urService.save(ur1);
		}
		else {
			UserRole ur = urService.findAEntity(userid);
			Person usergai = userService.getOneUser(userid);
			usergai.setUserTel(user.getUserTel());
			usergai.setUserName(user.getUserName());
			usergai.setEmail(user.getEmail());
			usergai.setSex(user.getSex());
			usergai.setDept(user.getDept());
			usergai.setPosition(user.getPosition());
			if(resetpassword)
			{
				usergai.setUserPass("123456");
			}
			userService.save(usergai);
			ur.setRoleId(roleId);
			urService.save(ur);
		}
		return "/usermanage";
	}
	
	@RequestMapping(value="/deleteuser",method=RequestMethod.GET)
	public String deleteUser(@RequestParam(value="userid")Long userid,Model model) {
		System.out.println("已经删除"+userid);
		//uservice.deleteUser(userid);
		return "redirect:/user/usermanage";
	}

}
