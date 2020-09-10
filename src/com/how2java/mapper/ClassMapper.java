package com.how2java.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.how2java.pojo.Class;
import com.how2java.util.Page;

public interface ClassMapper {
	public Class getClass(String classId);
	
	public List<Class> getAllClass();
	//·ÖÒ³
	public List<Class> getAllClass(@Param("page")Page page);
	
	public List<Class> selectByGrade(String gradeNumber);
	
	public int addClass(Class newClass);
	
	public void alterClass(@Param("className")String className,@Param("classId")String classId);
	
	public int deleteOneClass(String classId);
	
	public int getClassCount();
}
