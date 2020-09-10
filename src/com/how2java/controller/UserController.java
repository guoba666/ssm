package com.how2java.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.how2java.pojo.Class;
import com.how2java.pojo.User;
import com.how2java.service.ClassService;
import com.how2java.service.UserService;
import com.how2java.util.Page;


@Controller
@RequestMapping("")
public class UserController {
	
	@Autowired
	UserService userService;
	@Autowired
	ClassService classService;
	
	@RequestMapping(value="checklogin",method=RequestMethod.POST)
	@ResponseBody
	public int checklogin(@RequestParam("account")String account,@RequestParam("pwd")String pwd,User user,HttpSession session) throws Exception{
		int message = userService.checklogin(account, pwd);
		
		return message;
	}
	
	@RequestMapping("toregister")
	public String toregister() {
		return "register";
	}
	
	@RequestMapping("register")
	@ResponseBody
	public int register(String account,String pwd) {
		int message;
		int find = userService.isAccountExist(account);
		if(account.length()==0 || pwd.length()==0) {
			message = -1;//返回“提交信息有误”
		}
		else if(find==0) {
			userService.regist(account, pwd);
			message=1;//返回“注册成功”
		}else {
			message=0;//返回“账号已存在”
		}
		return message;
	}
	
	@RequestMapping("toChangePwd")
	public String tochangePwd() {
		return "change";
	}
	
	@RequestMapping("changePwd")
	@ResponseBody
	public int changePwd(@Param("account")String account,@Param("pwd")String pwd,@Param("newpwd")String newpwd) {
		int message;
		if( userService.checklogin(account, pwd)==1 && account.length()!=0 && pwd.length()!=0 && newpwd.length()!=0) {
			message=userService.changePwd(account, newpwd);
		}else {
			message=0;
		}
		System.out.println("返回成功！");
		return message;
	}
	
	@RequestMapping("success")
	public ModelAndView turnsuccess(HttpSession session,Page page) {
		ModelAndView mav = new ModelAndView("success");
		String account = (String)session.getAttribute("account");
		List<String> record_list = userService.listRecord(account,page);
		int total = userService.total(account);
		page.caculateLast(total);
		mav.addObject("listRecord",record_list);
		mav.addObject("account",account);
		return mav;
	}
	
	@RequestMapping("fail")
	public ModelAndView tofail() {
		ModelAndView mav = new ModelAndView("fail");
		mav.getModel().put("message","请先登陆账号");
		return mav;
	}
	
	
	
	@RequestMapping("history")
	public String toHistory() {
		return "history";
	}
	@RequestMapping("informs")
	public String toInforms() {
		return "informs";
	}
	@RequestMapping("teacherMessage")
	public String toTeacherMessage() {
		return "teacherMessage";
	}
	
	
	
	@RequestMapping("class")
	public ModelAndView toClass(@Param("page")Page page) {
		ModelAndView mav =new ModelAndView("/basedata/class");
		List<Class> classList=classService.getAllClass(page);
		if(classList==null) {
			System.out.println("控制层——分页查询失败");
		}
		mav.addObject("classList",classList);
		return mav;
	}
	
	@RequestMapping("teacher")
	public String toTeacher() {
		return "basedata/teacher";
	}
}
