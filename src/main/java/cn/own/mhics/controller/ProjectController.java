package cn.own.mhics.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.own.mhics.entity.Person;
import cn.own.mhics.entity.Project;
import cn.own.mhics.service.PersonService;
import cn.own.mhics.service.ProjectService;

@Controller
@RequestMapping(value="project")
public class ProjectController {

	@Autowired
	private ProjectService projectService;
	
	@Autowired 
	private PersonService personService;
	
	@RequestMapping(value="/projectmanage")
	public String getProjectList(HttpServletRequest req,Model model) {
		projectService.getAllProject(req);
		
		return "project/projectmanage";
	}
	
	@RequestMapping(value="/projectedit",method =RequestMethod.GET)
	public String projectEdit(@RequestParam(value="projectid",required=false)Long projectId,Model model ) {
		if(projectId != null) {
			Project project = projectService.findOne(projectId);
			model.addAttribute("project",project);
			model.addAttribute("exitproject","yes");
		}
		List<Person> userList = personService.findAllPerson();
		model.addAttribute("users",userList);
		return "project/editproject";
	}
	@RequestMapping(value="/projecteditsave",method =RequestMethod.POST)
	public String projectEditSave(Project project,@RequestParam("persononeid")Long personOneId,@RequestParam("persontwoid")Long personTwoId,Model model) {
			Person personOne= personService.getOneUser(personOneId);
			Person personTwo= personService.getOneUser(personOneId);
			project.setPersonOne(personOne);
			project.setPersonTwo(personTwo);
			projectService.save(project);
		return "redirect:projectmanage";
	}
	
}
