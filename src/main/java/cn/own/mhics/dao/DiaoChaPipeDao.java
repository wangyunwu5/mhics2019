package cn.own.mhics.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import cn.own.mhics.entity.DiaoChaPipe;

public interface DiaoChaPipeDao extends JpaRepository<DiaoChaPipe, Long> {
	
	@Query("select dcp from DiaoChaPipe as dcp where dcp.diaoChaNode.dcNodeId=?1")
	List<DiaoChaPipe> findDiaoChaPipesByNodeId(Long dcnodeId);

	@Query("select dcp from DiaoChaPipe as dcp where dcp.dcpipeId=?1")
	DiaoChaPipe findOneDiaoChaPipe(Long pipeId);

	

}
