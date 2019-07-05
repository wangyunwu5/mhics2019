package cn.own.mhics.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.own.mhics.dao.DiaoChaNodeDao;
import cn.own.mhics.entity.DiaoChaNode;
import cn.own.mhics.entity.Node;

@Service 
@Transactional
public class DiaoChaNodeService {
	
	@Autowired
	private DiaoChaNodeDao dianChaNodeDao;

	public List<DiaoChaNode> getNodeDiaoChaByNo(String nodeNo) {
		return dianChaNodeDao.getDiaoChaByNo(nodeNo);
	}
	public List<DiaoChaNode> getNodeDiaoChaAll() {
		return dianChaNodeDao.getDiaoChaAll();
	}
	public DiaoChaNode getOneNodeDiaoChaByNo(String nodeNo) {
		return dianChaNodeDao.getNodeDiaoChaByNo(nodeNo);
	}

	public DiaoChaNode getOneDiaoChaNode(Long dcnodeId) {
		return dianChaNodeDao.getOneDiaoChaNode(dcnodeId);
	}

	public void save(DiaoChaNode nodeNew) {
		dianChaNodeDao.save(nodeNew);
	}


}