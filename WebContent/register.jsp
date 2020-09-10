<%@ page language="java" contentType="text/html; charset=utf-8"
 pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="http://how2j.cn/study/jquery.min.js"></script>
</head>
<script type="text/javascript" language="JavaScript">
$(document).ready(function () {
    $('#register').click(function () {
        $.ajax({
            type: "post",
            url: "/ssm/register",
            data: {
                "account": $("#account").val(),
                "pwd": $("#pwd").val(),
            },
            dataType: "JSON",
            async: false,
            
            success: function (message) {
                if (message == -1) {
                    alert("提交信息有误")
 					
                }
                else if(message == 1){
                    alert("注册成功！");
                    location="index.jsp"
                }
                else{
                	alert("账号已存在！")
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("提交失败");
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
            }
        });
    })
})
</script>
<body>
	
	<center>
	<h1>注册界面</h1>
		<form action="register" method="post">
			用户名:<input type="text" id="account"/>
			密码：<input type="password" id="pwd"/>
			<br>
		</form>
		
		<button id="register">提交</button>
	</center>
</body>
</html>