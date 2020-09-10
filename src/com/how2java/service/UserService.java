package com.how2java.service;

import java.util.List;

import com.how2java.pojo.User;
import com.how2java.util.Page;


public interface UserService {
	
	public int checklogin(String account,String pwd);
	
	public int regist(String account,String pwd);
	
	public int isAccountExist(String account);
	
	public int changePwd(String account,String pwd);

	public void loginRecord(String account);
	
	//分页查询前的函数
	//public List<String> listRecord(String account);
	
	public List<String> listRecord(String account);
	public List<String> listRecord(String account,Page page);
	
	public int total(String account);
}
