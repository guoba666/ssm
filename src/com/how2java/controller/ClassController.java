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
	
	//添加一个班级
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
			System.out.println("控制器——添加班级失败！");
			message=-1;
		}
		return message;
	}
	
	//修改班级名称
	@RequestMapping(value="alterOneClass",method=RequestMethod.POST)
	@ResponseBody
	public void alterOneClass(@Param("className")String className,@Param("classId")String classId) {
		System.out.println("有一个修改操作：");
		System.out.println("classId:"+classId);
		System.out.println("className:修改为"+className);
		classService.alterClass(className, classId);
	}
	
	//班级刷新
	@RequestMapping(value="classRefresh",method=RequestMethod.POST)
	@ResponseBody
	public List<Class> ClassRefresh() {
		if(classService.getAllClass()==null) {
			System.out.println("刷新班级列表失败！");
			return null;
		}else {
			List<Class> classList = classService.getAllClass();
			System.out.println("返回班级列表成功");
			return classList;
		}
	}
	
	//班级查询
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
			System.out.println("控制器——班级查询失败");
			return null;
		}
		return classList;
	}
	
	//删除班级
	
	@RequestMapping(value="deleteOneClass",method=RequestMethod.POST)
	@ResponseBody
	public int deleteOneClass(@Param("classId")String classId) {
		int message=classService.deleteOneClass(classId);
		return message;
	}
	
	
	//计算分页查询的总页数并返回给前端
	@RequestMapping(value="getTotalPageCount",method=RequestMethod.POST)
	@ResponseBody
	public int getTotalPageCount() {
		System.out.println("进入查询总页数的控制器");
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
