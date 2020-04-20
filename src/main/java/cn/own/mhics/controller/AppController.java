package cn.own.mhics.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.boot.SpringBootVersion;
import org.springframework.core.SpringVersion;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import cn.own.mhics.common.ResponseBean;

@RestController
@RequestMapping(value="/nodeapp")
public class AppController {
	
	
	@RequestMapping(value="/finduser",method=RequestMethod.GET)
	public String findUser(HttpSession session,HttpServletRequest req) {
		System.out.println("finduser访问成功");
		String[] user = new String[3];
		user[0]="00023";
		user[1]="yang";
		user[2]="16岁";
		System.out.println("springboot版本号为："+SpringVersion.getVersion()+"---->"+SpringBootVersion.getVersion());
		
		return "success";//new ResponseBean(200,"登录成功",user);
	}
	@RequestMapping(value="/user/login",method=RequestMethod.POST)
	public ResponseBean appLogin(String username,String password) {
		System.out.println("提交的数据为："+username+"---"+password);
		String token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoi5pmo5YWI55SfIiwiaWQiOiIyIiwidXVpZCI6IjFkZDRkNjQwLTViMTctNDc1NC1hNWE2LWNiNjQyMGRkYmM1ZiJ9.KkcxlUU-g4AcoYoJbXAHaQEj-Av7lPuGg-B6uCSellQ";
		String[] data = new String[3];
		data[0] =username;
		data[1] =password;
		data[2] =token;

		return  new ResponseBean(200,"登录成功",data);
	}

}
