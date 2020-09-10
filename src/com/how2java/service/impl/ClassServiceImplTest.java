package com.how2java.service.impl;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.how2java.pojo.Class;
import com.how2java.service.ClassService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:applicationContext.xml"})

public class ClassServiceImplTest {
	@Autowired
	ClassService classService;
	@Test
	public void testGetClassString() {
		com.how2java.pojo.Class class1 = new com.how2java.pojo.Class();
		class1.setClassId("136");
		class1.setGradeNumber("13");
		class1.setGradeName("高一");
		class1.setClassName("六班");
		class1.setClassNumber("6");
		assertEquals(class1.getClassId(),classService.getClass("136").getClassId());
		assertEquals(class1.getGradeNumber(),classService.getClass("136").getGradeNumber());
		assertEquals(class1.getGradeName(),classService.getClass("136").getGradeName());
		assertEquals(class1.getClassName(),classService.getClass("136").getClassName());
		assertEquals(class1.getClassNumber(),classService.getClass("136").getClassNumber());
	}

	@Test
	public void testGetAllClass() {
		List<Class> list=classService.getAllClass();
		String[] expectResult= {"136","34","43","66","86"};
		for(int i=0;i<list.size();i++) {
			assertEquals(expectResult[i],list.get(i).getClassId());
		}
		
	}

	@Test
	public void testSelectByGrade() {
		List<Class> list=classService.selectByGrade("13");
		assertEquals("136",list.get(0).getClassId());
	}

	@Test
	public void testAddClass() {
		classService.addClass("13","4","一年级","3","三班");
	}

	@Test
	public void testDeleteOneClass() {
		classService.deleteOneClass("13");
	}

	@Test
	public void testGetClassCount() {
		assertEquals(5,classService.getClassCount());
	}

}
