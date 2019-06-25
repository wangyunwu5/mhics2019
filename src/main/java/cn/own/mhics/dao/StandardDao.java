package cn.own.mhics.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import cn.own.mhics.entity.Standard;

public interface StandardDao extends JpaRepository<Standard, Long> {

	@Query("select s from Standard as s")
	List<Standard> findAllStandard();
 
	@Modifying
    @Transactional
	@Query("delete from Standard as s where s.standardId=?1")
	void deleteStandard(Long standardId);

}
