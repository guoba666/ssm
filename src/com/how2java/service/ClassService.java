package com.how2java.service;

import java.util.List;


import com.how2java.pojo.Class;
import com.how2java.util.Page;
public interface ClassService {
	public Class getClass(String classId);
	
	public List<Class> getAllClass();
	
	public List<Class> getAllClass(Page page);
	
	public List<Class> selectByGrade(String gradeNumber);
	
	public int addClass(String classId,String gradeNumber,String gradeName,String classNumber,String className);
	
	public void alterClass(String className,String classId);
	
	public int deleteOneClass(String classId);
	
	public int getClassCount();
}
