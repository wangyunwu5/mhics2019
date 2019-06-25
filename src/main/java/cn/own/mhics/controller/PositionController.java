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
import cn.own.mhics.service.DeptService;
import cn.own.mhics.service.PositionService;

@Controller
@RequestMapping(value="/position")
public class PositionController {

	@Autowired
	private PositionService positionService;
	@Autowired
	private DeptService deptService;
	
	@RequestMapping(value="/positionmanage")
	public String getPositionList(HttpServletRequest req,Model model) {
		List<Position> positions=positionService.findAllPosition();
		model.addAttribute("positions",positions);
		return "position/positionmanage";
	}
	@RequestMapping(value="/positionedit",method=RequestMethod.GET)
	public String positionEdit(@RequestParam(value="positionid",required=false)Long positionId,Model model) {
		if(positionId!=null) {
			Position position = positionService.findOne(positionId);
			model.addAttribute("position",position);
		}
		List<Dept> depts = deptService.findAllDept();
		model.addAttribute("depts",depts);
		return "position/positionedit";
	}
	
	@RequestMapping(value="/positionedit",method=RequestMethod.POST)
	public String positionEditSave(Position position,@RequestParam(value="deptId",required=false)int deptId,Model model) {
		Dept dept = deptService.findOne(deptId);
		position.setDept(dept);
		positionService.save(position);
		return "redirect:positionmanage";
	}
	
	@RequestMapping(value="/positiondelete",method=RequestMethod.GET)
	public String positionEditSave(Position position,@RequestParam(value="positionid")Long positionId,Model model) {
		Position position1 = positionService.findOne(positionId);
		positionService.delete(position1);
		return "redirect:positionmanage"; 
	}
}
