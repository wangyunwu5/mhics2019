package cn.own.mhics.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="investigation")
public class InvestigationController {
	
	
	@RequestMapping(value="/investigationmanage")
	public String getInvestigationLists(HttpServletRequest req) {
		
		return "investigation/investigationmanage";
	}
	
	@RequestMapping(value="/investigationedit",method=RequestMethod.GET)
	public String investigationEdit(Model model) {
		 
		return "investigation/investigationedit";
	}
	
	@RequestMapping(value="/investigationedit",method=RequestMethod.POST)
	public String investigationEditSave() {
		
		return "investigation/investigationedit";
	}
}
