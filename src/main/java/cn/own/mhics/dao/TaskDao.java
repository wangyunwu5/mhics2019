package cn.own.mhics.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import cn.own.mhics.entity.Task;

public interface TaskDao extends JpaRepository<Task, Long> {

	
	@Query("select t from Task as t")
	List<Task> getAllTask();
	
	@Modifying
	@Query("update Task as T set T.statusId=?1 where T.taskId=?2")
	void updateById(int i,Long taskId);
	
	@Query("select T from Task as T where T.taskId in(select tr.task.taskId"
			+ " from TaskRecive as tr where tr.person.userId=?1)")
	List<Task> getMyTasks(Long userId);
	
}
