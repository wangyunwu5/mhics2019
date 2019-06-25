package cn.own.mhics.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.own.mhics.entity.Standard;
import cn.own.mhics.service.StandardService;

@Controller
@RequestMapping(value="/standard")
public class StandardController {
	
	@Autowired
	private StandardService standardService;
	
	@RequestMapping(value="/standardmanage")
	public String getAllStandard(Model model) {
		List<Standard> standards = standardService.findAllStandard();
		model.addAttribute("standards",standards);
		return "standard/standardmanage";
	}
    
	@RequestMapping(value="/standardedit",method = RequestMethod.GET)
	public String standardEdit(Model model,@RequestParam(value="standardid",required=false)Long standardId) {
		if(standardId!=null) {
			Standard standard = standardService.findOne(standardId);
			model.addAttribute("standard",standard);
		}
		return "standard/editstandard";
	}
	@RequestMapping(value="/standardeditsave",method=RequestMethod.POST)
	public String saveStandard(Standard standard,Model model) {
		Long standardId = standard.getStandardId();
		if(standardId==null) {
			standardService.save(standard);
		}
		else {
			Standard stand = standardService.findOne(standardId);
			stand.setDescriptionCn(standard.getDescriptionCn());
			stand.setDescriptionEn(standard.getDescriptionEn());
			stand.setCodeSimple(standard.getCodeSimple());
			stand.setCodeFull(standard.getCodeFull());
			stand.setCodeMean(standard.getCodeMean());
			stand.setRemark(standard.getRemark());
			standardService.save(stand);
		}
		return "redirect:/standard/standardmanage";
	}
	@RequestMapping(value="/deletestandard",method=RequestMethod.GET)
	public String deleteStandard(Model model,@RequestParam(value="standardid")Long standardId) {
		standardService.deleteStandard(standardId);
		return "redirect:/standard/standardmanage";
	}
	
}
