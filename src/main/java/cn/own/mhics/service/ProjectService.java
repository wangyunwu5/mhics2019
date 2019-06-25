package cn.own.mhics.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.own.mhics.dao.ProjectDao;
import cn.own.mhics.entity.Project;
import cn.own.mhics.entity.ProjectUser;

@Service
@Transactional
public class ProjectService {
	
	@Autowired
	private ProjectDao projectDao;
	
	public void getAllProject(HttpServletRequest req) {
		List<Project> projects=projectDao.getAllProject();
		req.setAttribute("projects",projects);
	}
	
	public void projectEdit(Project project) {
		projectDao.save(project);
	}
	
	public Project findOne(Long projectId) {
		return projectDao.findOne(projectId);
	}

	public void save(Project project) {
		projectDao.save(project);
	}

	public List<Project> getAllProjectList() {
		return projectDao.getAllProject();
	}

	public List<Project> getAllProjects() {
		return projectDao.getAllProject();
	}


}
