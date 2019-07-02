package cn.own.mhics.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import cn.own.mhics.entity.Pipe;

public interface PipeDao extends JpaRepository<Pipe, Long> {
	
	@Query("select p from Pipe as p where p.pipeId=?1")
	Pipe findOnePipe(Long pipeId);

	@Query("select p from Pipe as p where p.node.nodeId=?1")
	List<Pipe> findPipesByNode(Long nodeId);

}
