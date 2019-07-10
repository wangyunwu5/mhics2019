package cn.own.mhics.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.own.mhics.entity.Role;
import cn.own.mhics.entity.SystemMenu;
import cn.own.mhics.service.IndexService;
import cn.own.mhics.service.RoleService;

@Controller
@RequestMapping(value="/role")
public class RoleController {
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private IndexService indexService;
	
	@RequestMapping(value="/rolemanage")
	public String getRoleList(Model model) {
		List<Role> roles = roleService.findAllRole();
		model.addAttribute("roles",roles);
		return "role/rolemanage";
	}
	
	@RequestMapping(value="/roleedit",method = RequestMethod.GET)
	public String roleEdit(@RequestParam(value="roleid",required = false)Integer roleId,Model model) {
		
		if(roleId != null) {
			Role role = roleService.findOneRole(roleId);
			model.addAttribute("role",role);
		}
		return "role/roleedit";
	}
	
	@RequestMapping(value="/rolesave",method = RequestMethod.POST)
	public String roleSave(Model model,Role role) {
		if(role.getRoleId() !=null) {
			Role roleUpdate = roleService.findOneRole(role.getRoleId());
			roleUpdate.setRoleName(role.getRoleName());
			roleUpdate.setRemark(role.getRemark());
			roleService.save(roleUpdate);
		}
		else {
			roleService.save(role);
		}
		return "redirect:rolemanage";
	}
	
	@RequestMapping(value="/roleset",method = RequestMethod.GET)
	public String roleSet(Model model,@RequestParam(value="id")Integer roleId) {
		Role role = roleService.findOneRole(roleId);
		List<SystemMenu> paMenu = indexService.findPaMenu(0L);
		List<SystemMenu> sonMenu = indexService.findSonMenu(0L);
		
		model.addAttribute("pamenu",paMenu);
		model.addAttribute("sonmenu",sonMenu);
		model.addAttribute("roleid",roleId);
		model.addAttribute("rolename",role.getRoleName());
		return "role/roleset";
	}
}
