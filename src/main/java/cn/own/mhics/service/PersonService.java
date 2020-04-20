package cn.own.mhics.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.own.mhics.dao.PersonDao;
import cn.own.mhics.entity.Role;
import cn.own.mhics.entity.SystemMenu;
import cn.own.mhics.entity.Person;

@Service
@Transactional
public class PersonService {
	@Autowired
	private PersonDao userDao;
	
	public void getAllUser(HttpServletRequest req) {
		List<Person> userList = userDao.findAllUser();
		req.setAttribute("userlist",userList);
	}
	public Person getOneUser(Long userId) {
		return userDao.getOneUser(userId);
	}
	public Role getUserRole(Long userId) {
		return userDao.getUserRole(userId);
	}
	public void save(Person user) {
		userDao.save(user);
	}
	public Person getOneByAccount(String userAccount) {
		return userDao.getOneByAccount(userAccount);
	}
	public void deleteUser(Long userId) {
		userDao.delete(userDao.getOneUser(userId));
	}
	public List<Person> findAllPerson() {
		return userDao.findAllUser();
	}
	public List<Person> getMyStaff(Long userId) {
		return userDao.getMyStaff(userId);
	}
	public Person findUserByAccountAndPass(String userAccount, String userPass) {
		return userDao.findUserByAccountAndPass(userAccount,userPass);
	}
	/*
	 * 待完成功能
	 */
	public List<Role> getRoleByAccount(String account) {
		
		return null;
	}
	public List<SystemMenu> getSystemMenuByRole(Integer roleId) {

		return null;
	}
}
