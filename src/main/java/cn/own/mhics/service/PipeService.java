package cn.own.mhics.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.own.mhics.dao.DiaoChaPipeDao;
import cn.own.mhics.dao.PipeDao;
import cn.own.mhics.entity.DiaoChaPipe;
import cn.own.mhics.entity.Pipe;

@Service
@Transactional
public class PipeService {

	
	@Autowired
	private PipeDao pipeDao;
	
	@Autowired
	private DiaoChaPipeDao diaochapipeDao;
	
	public void savePipe(Pipe pipe) {
		pipeDao.save(pipe);
	}
	public void saveDcpipe(DiaoChaPipe dcpipe) {
		diaochapipeDao.save(dcpipe);
	}

	public Pipe findOnePipe(Long pipeId) {
		return pipeDao.findOnePipe(pipeId);
	}

	public List<Pipe> findPipesByNode(Long nodeId) {
		return pipeDao.findPipesByNode(nodeId);
	}

	public void deletePipeById(Long pipeId) {
		pipeDao.delete(pipeDao.findOnePipe(pipeId));
	}

	public List<DiaoChaPipe> findDiaoChaPipesByNode(Long dcnodeId) {
		return diaochapipeDao.findDiaoChaPipesByNodeId(dcnodeId);
	}
	
	public DiaoChaPipe findOneDiaoChaPipe(Long pipeId) {
		return diaochapipeDao.findOneDiaoChaPipe(pipeId);
	}
	public void deleteDiaoChaPipeById(Long pipeId) {
		diaochapipeDao.delete(diaochapipeDao.findOneDiaoChaPipe(pipeId));
	}
}
