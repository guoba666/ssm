<%@ page language="java" contentType="text/html; charset=utf-8"
 pageEncoding="UTF-8" import="com.how2java.pojo.*" %>
 <%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

<body>
	<h1><%=request.getAttribute("message")%></h1>
	<a href="index.jsp">点击此处登陆</a>
</body>

</html>