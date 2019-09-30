package cn.own.mhics.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import cn.own.mhics.common.Result;
import cn.own.mhics.common.ResultGenerator;
import cn.own.mhics.entity.Task;
import cn.own.mhics.service.TaskService;

@RestController
public class RestfulApiController {
	@Autowired
	private TaskService taskService;
	
	@GetMapping(value="/user/task/{userid}")
	public Result getTaskByUserId(@PathVariable("userid")Long userId){
		System.out.println("接口访问成功");
		List<Task> taskList =taskService.getTaskToMobile(userId);
		System.out.println("查询到数据为："+taskList);
		Result result = ResultGenerator.genSuccessResult(taskList);
		return result;
	} 

}
