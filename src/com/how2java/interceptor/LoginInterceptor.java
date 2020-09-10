package com.how2java.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.how2java.pojo.User;

public class LoginInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
		// TODO Auto-generated method stub
		//允许放行的url路径
		
        //获取session
				
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("UserSession");
        //判断session中是否有用户数据，如果有，则返回true，继续向下执行
        if (user == null ) {
        	System.out.println("user不存在，已拦截");
        	request.getRequestDispatcher("/fail").forward(request,response);
            return false;
        }
        System.out.println("user存在，放行");
        return true;
        //不符合条件的给出提示信息，并转发到登录页面
       
	}


	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("postHandle被执行");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
      
		System.out.println("afterCompletion被执行");
	}
}
