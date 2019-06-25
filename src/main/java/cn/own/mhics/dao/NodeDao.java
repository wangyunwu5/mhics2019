package cn.own.mhics.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import cn.own.mhics.entity.Node;

public interface NodeDao extends JpaRepository<Node, Long> {

	@Query("select n from Node as n group by n.nodeNo")
	List<Node> getAllNode();
	
	@Query("select n from Node as n where n.insertMan.userId=?1")
	List<Node> getMyNode(Long userId);
	
	@Query("select n from Node as n where n.nodeId=?1")
	Node getOneNode(Long nodeId);
	
	@Query("select distinct n.nodeNo from Node as n")
	List<String> getNodeNo();

	@Query("select n from Node as n where n.nodeNo=?1")
	List<Node> getNodeByNo(String nodeNo);
	
	@Query("select n from Node as n where n.nodeNo=?1")
	Node findOneByNo(String nodeNo);

}
