package cn.own.mhics.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.own.mhics.dao.TaskDao;
import cn.own.mhics.dao.TaskReciveDao;
import cn.own.mhics.entity.Task;
import cn.own.mhics.entity.TaskRecive;

@Service
@Transactional
public class TaskService {
	
	@Autowired
	private TaskDao taskDao;
	
	@Autowired
	private TaskReciveDao trDao;
	
	public void getAllTask(HttpServletRequest req) {
		List<Task> tasks = taskDao.getAllTask();
		req.setAttribute("tasks",tasks);
	}

	public Task findOne(Long taskId) {
		return taskDao.findOne(taskId);
	}

	public void save(Task task) {
		taskDao.save(task);
	}

	public void save(TaskRecive taskRecive) {
		trDao.save(taskRecive);
	}

	public void updateTask(Long taskId, int i) {
		taskDao.updateById(i,taskId);
	}

	public void getMyTasks(HttpServletRequest req,Long userId) {
 		List<Task> tasks=taskDao.getMyTasks(userId);
 		req.setAttribute("tasks",tasks);
	}

	public List<Task> getTaskToMobile(Long userId) {
		return taskDao.getAllTask();
	}
}
