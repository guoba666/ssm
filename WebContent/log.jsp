<%@ page language="java" contentType="text/html; charset=utf-8"
 pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="http://how2j.cn/study/jquery.min.js"></script>
</head>

<script type="text/javascript" language="JavaScript">
$(document).ready(function () {
    $('#login').click(function () {
        $.ajax({
            type: "post",
            url: "/ssm/checklogin",
            data: {
                "account": $("#account").val(),
                "pwd": $("#pwd").val(),
            },
            dataType: "JSON",
            async: false,
            
            success: function (message) {
                if (message != 0) {
                   	//window.location.href="success?account="+$("#account").val();
                   	
                   	window.location.href="success";
                } else {
                    alert("用户名或者密码错误!");
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("提交失败");
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
            }
        });
    })
    
    $("#register").click(function (){
    	location="register.jsp";
    })
    
    $("#checkRecord").click(function(){
		window.location.href="success";
	})
	
	$("#toChangePwd").click(function(){
		window.location.href="toChangePwd";
	})
   
})


</script>

<body>
	
	<center>
	<h1>登陆界面</h1>
		<form>
			用户名:<input type="text" id="account"/>
			密码：<input type="password" id="pwd"/>
			<br>
		</form>
		
		<button id="login" >登陆</button>
		<button id="register" >注册</button>
		<button id="toChangePwd">修改密码</button>
		<button id="checkRecord">查看历史记录</button>
		
	</center>
</body>

</html>