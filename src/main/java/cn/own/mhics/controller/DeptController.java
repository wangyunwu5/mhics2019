package cn.own.mhics.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.own.mhics.entity.Dept;
import cn.own.mhics.entity.Person;
import cn.own.mhics.entity.Position;
import cn.own.mhics.entity.Test;
import cn.own.mhics.service.DeptService;
import cn.own.mhics.service.PersonService;

@Controller
@RequestMapping(value="dept")
public class DeptController {

	@Autowired
	private DeptService deptService;
	
	@Autowired
	private PersonService personService;
	
	@RequestMapping(value="/deptmanage")
	private String getDeptList(HttpServletRequest req,Model model) {
		deptService.findAllDept(req);
		return "dept/deptmanage";
	}
	
	@RequestMapping(value="/deptedit",method =RequestMethod.GET)
	public String deptEdit(@RequestParam(value="deptid",required=false)Integer deptId,
		@RequestParam(value="managerid",required=false)Long managerId,Model model) {
		if(deptId !=null)
		{
			Dept dept = deptService.findOne(deptId);
			Person manager = personService.getOneUser(managerId);
			model.addAttribute("dept",dept);
			model.addAttribute("manager",manager);
			System.out.println("部门id、经理id分别为："+deptId+"+"+managerId); 
		}
		return "dept/deptedit";
	}
	/**
	 * 新增或者修改
	 * @param dept
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/deptedit",method =RequestMethod.POST)
	public String deptEditSave(Dept dept,Model model) {
		Integer deptId= dept.getDeptId();
		if(deptId!=null) {
			 Dept deptGai = deptService.findOne(deptId);
			 deptGai.setName(dept.getName());
			 deptGai.setDeptAddr(dept.getDeptAddr());
			 deptGai.setDeptTel(dept.getDeptTel());
			 deptGai.setManagerId(dept.getManagerId());
			 deptService.save(deptGai);
		}
		else {
			deptService.save(dept);
		}
		return "redirect:deptmanage";
	} 
	
	@RequestMapping(value="testedit",method=RequestMethod.POST)
	public String saveTest(Test test,Model model) {
		System.out.println("测试的时间为："+test.getTestTime());
		return "redirect:dept/deptmanage";
	}
	  
	
	
}
