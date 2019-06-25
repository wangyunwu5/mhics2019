package cn.own.mhics.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.own.mhics.dao.PositionDao;
import cn.own.mhics.entity.Position;

@Service
@Transactional
public class PositionService {

	@Autowired
	private PositionDao  positionDao;
	
	public List<Position> findAllPosition(){
		return positionDao.findAllPosition();
	}

	public Position findOne(Long positionId) {
		return positionDao.findOne(positionId);
	}

	public void save(Position position) {
		positionDao.save(position);
	}

	
	public void delete(Position position1) {
		positionDao.delete(position1);
	}
	
	
}
