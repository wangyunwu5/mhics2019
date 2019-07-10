package cn.own.mhics.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.own.mhics.dao.RoleDao;
import cn.own.mhics.entity.Role;

@Service
@Transactional
public class RoleService {
	
	@Autowired
	private RoleDao roleDao;
	
	public List<Role> findAllRole(){
		return roleDao.findAllRole();
	}

	public Role findOneRole(Integer roleId) {
		return roleDao.findOneRole(roleId);
	}

	public void save(Role role) {
		roleDao.save(role);
	}

}
