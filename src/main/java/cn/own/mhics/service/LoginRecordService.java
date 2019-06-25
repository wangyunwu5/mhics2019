package cn.own.mhics.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.own.mhics.dao.LoginRecordDao;
import cn.own.mhics.entity.LoginRecord;

@Service
@Transactional
public class LoginRecordService {
	
	@Autowired
	private LoginRecordDao loginRecordDao;
	
	public void saveLoginRecord(LoginRecord loginRecord) {
		loginRecordDao.save(loginRecord);
	}

}
