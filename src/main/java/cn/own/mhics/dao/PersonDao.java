package cn.own.mhics.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import cn.own.mhics.entity.Role;
import cn.own.mhics.entity.Person;

public interface PersonDao extends JpaRepository<Person, Long> {

	@Query("select u from Person as u")
	List<Person> findAllUser();
	@Query("select u from Person as u where u.userId=?1")
	Person getOneUser(Long userId);
	
	@Query("select r from UserRole as ur,Person as u,Role as r where ur.roleId=r.roleId and ur.userId=u.userId and u.userId=?1")
	Role getUserRole(Long userId);
	
	@Query("select u from Person as u where u.userAccount=?1")
	Person getOneByAccount(String userAccount);
	
	@Query("select u1 from Person as u1 where u1.dept.deptId=(select u2.dept.deptId from Person as u2 where u2.userId=?1)")
	List<Person> getMyStaff(Long userId);
	
	@Query("select u from Person as u where u.userAccount=?1  and u.userPass=?2")
	Person findUserByAccountAndPass(String userAccount, String userPass);
}
