package cn.own.mhics.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import cn.own.mhics.entity.UserRole;

public interface UserRoleDao extends JpaRepository<UserRole, Integer> {

	@Query("select ur from UserRole as ur where ur.userId=?1")
	UserRole findAEntity(Long userid);
}
