<%@ page language="java" contentType="text/html; charset=utf-8"
 pageEncoding="UTF-8" import="com.how2java.pojo.*" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

<body>
	<h1>登陆成功！</h1>
	<h1>您的账号为：${sessionScope.account}</h1>
	
	<a href="index.jsp">返回登陆界面</a>
	<a href="backlogin">退出登陆</a>
	<table align='center' border='1' cellspacing='0'>
    <tr>
        <td>账号</td>
        <td>登陆时间</td>
    </tr>
    <c:forEach items="${listRecord}" var="c" varStatus="record">
        <tr>
            <td>${sessionScope.account}</td>
            <td>${c}</td>
        </tr>
    </c:forEach>
	</table>
	
	 <div style="text-align:center">
        <a href="?start=0">首  页</a>
        <a href="?start=${page.start-page.count}">上一页</a>
        <a href="?start=${page.start+page.count}">下一页</a>
        <a href="?start=${page.last}">末  页</a>
    </div>
</body>

</html>