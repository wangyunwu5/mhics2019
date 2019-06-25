package cn.own.mhics.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.own.mhics.entity.LoginRecord;


public interface LoginRecordDao extends JpaRepository<LoginRecord, Long> {

}
