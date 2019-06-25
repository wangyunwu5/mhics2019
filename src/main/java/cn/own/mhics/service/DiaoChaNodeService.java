package cn.own.mhics.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.own.mhics.dao.DiaoChaNodeDao;
import cn.own.mhics.entity.DiaoChaNode;

@Service 
@Transactional
public class DiaoChaNodeService {
	
	@Autowired
	private DiaoChaNodeDao dianChaNodeDao;

	public List<DiaoChaNode> getNodeDiaoChaByNo(String nodeNo) {
		return dianChaNodeDao.getDiaoChaByNo(nodeNo);
	}
	
	

}