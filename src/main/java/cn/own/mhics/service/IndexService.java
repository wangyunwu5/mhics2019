package cn.own.mhics.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.own.mhics.dao.IndexDao;
import cn.own.mhics.entity.SystemMenu;

@Service 
@Transactional
public class IndexService {

	@Autowired
	private IndexDao indexDao;
	
	public void findMenu(HttpServletRequest req) {
		List<SystemMenu> paMenuAll = indexDao.findParentMenu(0L);
		List<SystemMenu> sonMenuAll = indexDao.findSonMenu(0L);
		req.setAttribute("allpamenu",paMenuAll);
		req.setAttribute("allsonmenu",sonMenuAll);
	}
	/*
	 * public void printINlist(List<SystemMenu> paMenuAll ) { for(int i =
	 * 0;i<paMenuAll.size();i++) { System.out.println(paMenuAll.get(i)+"--+--"); } }
	 */
}
