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
			System.out.println("�����ڸð༶");
			return null;
		}
	}
	
	@Override
	public List<Class> getAllClass(){
		List<Class> classList=classMapper.getAllClass();
		if(classList==null) {
			System.out.println("������б���ʧ��");
			return null;
		}
		return classList;
	}
	
	@Override
	public List<Class> getAllClass(Page page){
		List<Class> classList=classMapper.getAllClass(page);
		if(classList==null) {
			System.out.println("������б���ʧ��");
			return null;
		}
		return classList;
	}
	
	@Override
	public List<Class> selectByGrade(String gradeNumber){
		List<Class> classlist=classMapper.selectByGrade(gradeNumber);
		if(classlist==null) {
			System.out.println("����㡪���༶��ѯʧ��");
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
		System.out.println("�������óɹ�");
		return 1;
	}
	
	@Override
	public void alterClass(@Param("className")String className,@Param("classId")String classId) {
		classMapper.alterClass(className, classId);
	}
	
	
	@Override
	public int deleteOneClass(@Param("classId")String classId) {
		int message=classMapper.deleteOneClass(classId);
		System.out.println("ɾ���������ص�message:"+message);
		return message;
	}
	
	@Override
	public int getClassCount() {
		int classCount=classMapper.getClassCount();
		return classCount;
	}
}
