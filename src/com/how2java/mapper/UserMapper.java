package com.how2java.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.how2java.pojo.User;
import com.how2java.util.Page;

public interface UserMapper {
	
	public int add(User user);
	
	public User get(String account);
	
	public int update(User user);
	
	public int isAccountExist(String account);
	
	public void loginRecord(String account);
	
	//增加分页查询的两个函数
	public List<String> listRecord(@Param("account")String account);
    
    public List<String> listRecord(@Param("account")String account,@Param("page")Page page);
	
	//public List<String> listRecord(@Param("account")String account);
	
	public int total(String account);
}
