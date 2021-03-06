package cn.own.mhics.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import cn.own.mhics.entity.DiaoChaNode;

public interface DiaoChaNodeDao extends JpaRepository<DiaoChaNode, Long> {
	
	@Query("select dc from DiaoChaNode as dc where dc.nodeNo=?1")
	List<DiaoChaNode> getDiaoChaByNo(String nodeNo);
	
	@Query("select dc from DiaoChaNode as dc where dc.dcNodeId=?1")
	DiaoChaNode getOneDiaoChaNode(Long dcnodeId);

	
	@Query("select dc from DiaoChaNode as dc where dc.nodeNo=?1")
	DiaoChaNode getNodeDiaoChaByNo(String nodeNo);

	@Query("select dc from DiaoChaNode as dc")
	List<DiaoChaNode> getDiaoChaAll();
	

}
