package cn.own.mhics.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import cn.own.mhics.entity.Dept;
import cn.own.mhics.entity.Deptkuoda;

public interface DeptDao extends JpaRepository<Dept, Integer> {

	@Query("select new cn.own.mhics.entity.Deptkuoda(de.deptId,de.name,de.deptTel,de.deptAddr,u.userAccount,u.userId)"
			+ " from Dept as de,Person as u where de.managerId=u.userId.userId")
	List<Deptkuoda> findAllDept();
	
}
