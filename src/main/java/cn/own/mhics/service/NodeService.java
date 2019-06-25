package cn.own.mhics.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.own.mhics.dao.NodeDao;
import cn.own.mhics.entity.Node;

@Service
@Transactional
public class NodeService {

	@Autowired
	private NodeDao nodeDao;
	
	public List<Node> getAllNode(){
		return nodeDao.getAllNode();
	}
	public List<Node> getMyNode(Long userId){
		return nodeDao.getMyNode(userId);
	}
	public void saveNode(Node node) {
		nodeDao.save(node);
	}
	public Node getOneNode(Long nodeId) {
		return nodeDao.getOneNode(nodeId);
	}
	public void save(Node node) {
		nodeDao.save(node);
	}
	public List<Node> getNodeByNo(String nodeNo) {
		return nodeDao.getNodeByNo(nodeNo);
	}
	public Node findOneByNo(String nodeNo) {
		return nodeDao.findOneByNo(nodeNo);
	}
}
