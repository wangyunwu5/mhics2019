package cn.own.mhics.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.own.mhics.dao.DeptDao;
import cn.own.mhics.entity.Dept;
import cn.own.mhics.entity.Deptkuoda;

@Service
@Transactional
public class DeptService {
	
	@Autowired
	private DeptDao deptDao;
	
	public List<Dept> findAllDept(){
		return deptDao.findAll();
	}
	public Dept findOne(int deptId) {
		return deptDao.findOne(deptId);
	}
	public void findAllDept(HttpServletRequest req){
		List<Deptkuoda> depts = deptDao.findAllDept();
		req.setAttribute("depts",depts);
	}
	public void save(Dept dept) {
		deptDao.save(dept);
	}

}
  