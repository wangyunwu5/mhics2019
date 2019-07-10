package cn.own.mhics.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.own.mhics.entity.Person;
import cn.own.mhics.entity.Project;
import cn.own.mhics.entity.Task;
import cn.own.mhics.entity.TaskRecive;
import cn.own.mhics.service.PersonService;
import cn.own.mhics.service.ProjectService;
import cn.own.mhics.service.TaskService;

@Controller
@RequestMapping(value="task")
public class TaskController {
	
	@Autowired
	private TaskService taskService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private PersonService personService;
	
	@RequestMapping(value="/taskmanage")
	public String getAllTask(HttpServletRequest req,Model model) {
		taskService.getAllTask(req);
		return "task/taskmanage";
	}
	
	@RequestMapping(value="/taskedit",method=RequestMethod.GET)
	public String taskEdit(@RequestParam(value="taskid",required=false)Long taskId,Model model) {
		 if(taskId!=null) {
			 Task task = taskService.findOne(taskId);
			 model.addAttribute("task",task);
		 }
		List<Project> projects=projectService.getAllProjectList();
		List<Person> persons=personService.findAllPerson();
		model.addAttribute("projects",projects);
		model.addAttribute("users",persons);
		return "task/taskedit";
	}
	
	@RequestMapping(value="/taskedit",method=RequestMethod.POST)
	public String taskEditSave(Task task,@RequestParam(value="projectid")Long projectId,@RequestParam(value="userid")Long userId,Model model) {
		Project project = projectService.findOne(projectId);
		Person person = personService.getOneUser(userId);
		task.setPerson(person);
		task.setProject(project);
		taskService.save(task);
		return "redirect:taskmanage";
	}

	@RequestMapping(value="assigntask",method=RequestMethod.GET)
	public String assignTask(@RequestParam(value="taskid")Long taskId,Model model,HttpSession session) {
		Long userId=(Long) session.getAttribute("userId");
		if(taskId!=null) {
			Task task = taskService.findOne(taskId);
			List<Person> staffs=personService.getMyStaff(2L);
			model.addAttribute("users",staffs);
			model.addAttribute("task",task);
		}
		return "task/assigntask";
	}
	@RequestMapping(value="assigntask",method=RequestMethod.POST)
	public String assignTask(@RequestParam(value="taskid")Long taskId,@RequestParam(value="userid")Long userId,Model model) {
		TaskRecive taskRecive = new TaskRecive();
		Task task = taskService.findOne(taskId);
		Person person = personService.getOneUser(userId);
		taskRecive.setPerson(person);
		taskRecive.setTask(task);   
		taskService.save(taskRecive);
		taskService.updateTask(taskId,1);
		return "redirect:taskmanage";
	}
	
	@RequestMapping(value="mytask")
	public String getMyTask(HttpServletRequest req,Model model) {
		taskService.getMyTasks(req,5L);
		return "task/mytasklist";
	}
}
