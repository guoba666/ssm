package com.how2java.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.how2java.mapper.UserMapper;
import com.how2java.pojo.User;
import com.how2java.service.UserService;
import com.how2java.util.Page;


@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper usermapper;
	
	@Override
	public int checklogin(@Param("account")String account,@Param("pwd")String pwd) {
		// TODO Auto-generated method stub
		//System.out.println(account+" "+pwd);
		User u = usermapper.get(account);
		int message=0;
		if(u!=null && (u.getAccount()).equals(account) && (u.getPwd()).equals(pwd)) {
			message=1;
		}else if(u==null){
			message=2;
		}else {
			message=3;
		}
		return message;
	}

	@Override
	public int regist(String account, String pwd) {
		// TODO Auto-generated method stub
		User user = new User();
		user.setAccount(account);
		user.setPwd(pwd);
		return usermapper.add(user);
		
	}
	
	@Override
	public int changePwd(String account,String newpwd) {
		User user = new User();
		user.setAccount(account);
		user.setPwd(newpwd);
		int x = usermapper.update(user);
		System.out.println("服务层更新后update返回的数据为："+x);
		return x;
		
	}
	
	@Override
	public int isAccountExist(String account) {
		int find = usermapper.isAccountExist(account);
		return find; //返回查找的用户在数据库中存在几个
	}
	
	@Override
	public void loginRecord(String account) {
		usermapper.loginRecord(account);
	}
	
	/* 分页查询前
	@Override
	public List<String> listRecord(String account){
		List<String> list = usermapper.listRecord(account);
		return list;
	}
	*/
	@Override
	public List<String> listRecord(String account){
		List<String> list = usermapper.listRecord(account);
		return list;
	}
	@Override
	public List<String> listRecord(String account,Page page){
		List<String> list = usermapper.listRecord(account,page);
		return list;
	}
	
	@Override
	public int total(String account) {
		return usermapper.total(account);
	}
}
