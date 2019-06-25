package cn.own.mhics.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import cn.own.mhics.entity.Project;

public interface ProjectDao extends JpaRepository<Project, Long> {

	/*
	 * @Query("select new cn.own.mhics.entity.ProjectUser(p.projectId, p.projectNo, p.drainageAreaCode, "
	 * +
	 * "u1.userId, u1.userAccount, p.createTime, u2.userId, u2.userAccount, p.startTime, p.endTime) "
	 * + "from Project p inner join p.personOne u1 inner join p.personTwo u2 ")
	 */
	@Query("select p from Project as p")
	List<Project> getAllProject();
	//

}
