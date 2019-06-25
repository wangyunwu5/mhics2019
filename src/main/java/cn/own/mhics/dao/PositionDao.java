package cn.own.mhics.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import cn.own.mhics.entity.Position;

public interface PositionDao extends JpaRepository<Position, Long> {
	@Query("select po from Position as po")
	List<Position> findAllPosition();

}
