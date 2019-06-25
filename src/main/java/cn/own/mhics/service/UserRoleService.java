package cn.own.mhics.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.own.mhics.dao.UserRoleDao;
import cn.own.mhics.entity.UserRole;

@Service
@Transactional
public class UserRoleService {

	@Autowired
	private UserRoleDao urDao;

	public UserRole findAEntity(Long userId) {
		return urDao.findAEntity(userId);
	}
	public void save(UserRole userRole) {
		urDao.save(userRole);
	}
}
