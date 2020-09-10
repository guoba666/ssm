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
		//������е�url·��
		
        //��ȡsession
				
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("UserSession");
        //�ж�session���Ƿ����û����ݣ�����У��򷵻�true����������ִ��
        if (user == null ) {
        	System.out.println("user�����ڣ�������");
        	request.getRequestDispatcher("/fail").forward(request,response);
            return false;
        }
        System.out.println("user���ڣ�����");
        return true;
        //�����������ĸ�����ʾ��Ϣ����ת������¼ҳ��
       
	}


	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("postHandle��ִ��");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
      
		System.out.println("afterCompletion��ִ��");
	}
}
