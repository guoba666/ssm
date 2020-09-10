package com.how2java.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.how2java.mapper.ClassMapper;
import com.how2java.pojo.Class;
import com.how2java.service.ClassService;
import com.how2java.util.Page;

@Service
public class ClassServiceImpl implements ClassService {

	@Autowired
	ClassMapper classMapper;
	
	
	@Override
	public Class getClass(@Param("classId")String classId) {
		Class newclass=classMapper.getClass(classId);
		if(newclass!=null) {
			return newclass;
		}else {
			System.out.println("不存在该班级");
			return null;
		}
	}
	
	@Override
	public List<Class> getAllClass(){
		List<Class> classList=classMapper.getAllClass();
		if(classList==null) {
			System.out.println("服务层列表创建失败");
			return null;
		}
		return classList;
	}
	
	@Override
	public List<Class> getAllClass(Page page){
		List<Class> classList=classMapper.getAllClass(page);
		if(classList==null) {
			System.out.println("服务层列表创建失败");
			return null;
		}
		return classList;
	}
	
	@Override
	public List<Class> selectByGrade(String gradeNumber){
		List<Class> classlist=classMapper.selectByGrade(gradeNumber);
		if(classlist==null) {
			System.out.println("服务层——班级查询失败");
		}
		return classlist;
	}
	
	@Override
	public int addClass(@Param("classId")String classId,@Param("gradeNumber")String gradeNumber,@Param("gradeName")String gradeName,
	@Param("classNumber")String classNumber,@Param("className")String className) {
		Class newClass = new Class();
		newClass.setClassId(classId);
		newClass.setGradeNumber(gradeNumber);
		newClass.setGradeName(gradeName);
		newClass.setClassNumber(classNumber);
		newClass.setClassName(className);
		
		classMapper.addClass(newClass);
		System.out.println("服务层调用成功");
		return 1;
	}
	
	@Override
	public void alterClass(@Param("className")String className,@Param("classId")String classId) {
		classMapper.alterClass(className, classId);
	}
	
	
	@Override
	public int deleteOneClass(@Param("classId")String classId) {
		int message=classMapper.deleteOneClass(classId);
		System.out.println("删除操作返回的message:"+message);
		return message;
	}
	
	@Override
	public int getClassCount() {
		int classCount=classMapper.getClassCount();
		return classCount;
	}
}
