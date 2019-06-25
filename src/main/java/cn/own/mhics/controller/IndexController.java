package cn.own.mhics.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.own.mhics.service.IndexService;

@Controller
@RequestMapping(value="/index")
public class IndexController {
	
	@Autowired
	private IndexService indexService;
	
	
	@RequestMapping("/toindex")
	public String toIndex(HttpServletRequest req,Model model) {
		indexService.findMenu(req);
		return "index/index";
	}
	
	@RequestMapping("/firstyemian")
	public String firstyemian(HttpServletRequest req,Model model) {
		model.addAttribute("username","苗人凤");
		return "commons/firstyemian";
	}
	
	@RequestMapping("/menumanage")
	public String getAllMenu(HttpServletRequest req,Model model) {
		indexService.findMenu(req);
		return "system/menumanage";
	}
	
	
}
