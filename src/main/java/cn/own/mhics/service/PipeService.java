package cn.own.mhics.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.own.mhics.dao.PipeDao;
import cn.own.mhics.entity.Pipe;

@Service
@Transactional
public class PipeService {

	
	@Autowired
	private PipeDao pipeDao;
	
	public void savePipe(Pipe pipe) {
		pipeDao.save(pipe);
	}

	public Pipe findOnePipe(Long pipeId) {
		return pipeDao.findOnePipe(pipeId);
	}

	public List<Pipe> findPipesByNode(Long nodeId) {
		return pipeDao.findPipesByNode(nodeId);
	}
}
