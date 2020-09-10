package com.how2java.controller;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.how2java.pojo.Class;
import com.how2java.service.ClassService;
import com.how2java.util.Page;

@Controller
@RequestMapping("/class")
public class ClassController {
	@Autowired
	ClassService classService;
	
	//���һ���༶
	@RequestMapping(value="addOneClass",method=RequestMethod.POST)
	@ResponseBody
	public int addOneClass(@Param("classId")String classId,@Param("gradeNumber")String gradeNumber,@Param("gradeName")String gradeName,
			@Param("classNumber")String classNumber,@Param("className")String className) {
		int message=0;
		Class newclass=classService.getClass(classId);
		if(newclass==null) {
			classService.addClass(classId, gradeNumber, gradeName, classNumber, className);
			message=1;
		}
		else if(newclass.getClassId().equals(classId)) {
			System.out.println("������������Ӱ༶ʧ�ܣ�");
			message=-1;
		}
		return message;
	}
	
	//�޸İ༶����
	@RequestMapping(value="alterOneClass",method=RequestMethod.POST)
	@ResponseBody
	public void alterOneClass(@Param("className")String className,@Param("classId")String classId) {
		System.out.println("��һ���޸Ĳ�����");
		System.out.println("classId:"+classId);
		System.out.println("className:�޸�Ϊ"+className);
		classService.alterClass(className, classId);
	}
	
	//�༶ˢ��
	@RequestMapping(value="classRefresh",method=RequestMethod.POST)
	@ResponseBody
	public List<Class> ClassRefresh() {
		if(classService.getAllClass()==null) {
			System.out.println("ˢ�°༶�б�ʧ�ܣ�");
			return null;
		}else {
			List<Class> classList = classService.getAllClass();
			System.out.println("���ذ༶�б�ɹ�");
			return classList;
		}
	}
	
	//�༶��ѯ
	@RequestMapping(value="selectByGrade",method=RequestMethod.POST)
	@ResponseBody
	public List<Class> selectByGrade(@Param("gradeNumber")String gradeNumber){
		List<Class> classList;
		if(gradeNumber.equals("0")) {
			classList=classService.getAllClass();
		}else {
			classList=classService.selectByGrade(gradeNumber);
		}
		
		if(classList==null) {
			System.out.println("�����������༶��ѯʧ��");
			return null;
		}
		return classList;
	}
	
	//ɾ���༶
	
	@RequestMapping(value="deleteOneClass",method=RequestMethod.POST)
	@ResponseBody
	public int deleteOneClass(@Param("classId")String classId) {
		int message=classService.deleteOneClass(classId);
		return message;
	}
	
	
	//�����ҳ��ѯ����ҳ�������ظ�ǰ��
	@RequestMapping(value="getTotalPageCount",method=RequestMethod.POST)
	@ResponseBody
	public int getTotalPageCount() {
		System.out.println("�����ѯ��ҳ���Ŀ�����");
		int totalPageCount=0;
		int classCount=classService.getClassCount();
		System.out.println("classCount:"+classCount);
		Page page=new Page();
		int eachPageCount=page.getCount();
		System.out.println("eachPageCount:"+eachPageCount);
		if(classCount%eachPageCount==0) {
			totalPageCount=classCount/eachPageCount;
		}else {
			totalPageCount=classCount/eachPageCount;
			totalPageCount+=1;
		}
		System.out.println(totalPageCount);
		return totalPageCount;
	}
}
