package cn.own.mhics.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.own.mhics.dao.StandardDao;
import cn.own.mhics.entity.Node;
import cn.own.mhics.entity.Standard;

@Service
@Transactional
public class StandardService {
	
	@Autowired
	private StandardDao standardDao;
	
	public List<Standard> findAllStandard(){
		return standardDao.findAllStandard();
	}

	public Standard findOne(Long standardId) {
		return standardDao.findOne(standardId);
	}

	public void save(Standard standard) {
		standardDao.save(standard);
	}

	public void deleteStandard(Long standardId) {
		standardDao.deleteStandard(standardId);
	}



}
