package cn.own.mhics.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import cn.own.mhics.entity.Role;

public interface RoleDao extends JpaRepository<Role, Integer> {
	@Query("select ro from Role as ro")
	List<Role> findAllRole();
  
}
