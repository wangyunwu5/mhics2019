package cn.own.mhics.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import cn.own.mhics.entity.SystemMenu;

public interface IndexDao extends JpaRepository<SystemMenu, Long> {
	
	@Query("select sm from SystemMenu as sm where sm.parentId=?1")
	List<SystemMenu> findParentMenu(Long parentId);
	
	@Query("select sm from SystemMenu as sm where sm.parentId!=?1")
	List<SystemMenu> findSonMenu(Long parentId);
	
	
	
	
}
 