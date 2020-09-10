<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="http://how2j.cn/study/jquery.min.js"></script>
</head>
<script type="text/javascript" language="JavaScript">
$(document).ready(function () {
    $('#changePwd').click(function () {
        $.ajax({
            type: "post",
            url: "/ssm/changePwd",
            data: {
                "account": $("#account").val(),
                "pwd": $("#pwd").val(),
                "newpwd":$("#newpwd").val(),
            },
            dataType: "JSON",
            async: false,
            
            success: function (message) {
                if (message != 0) {
					alert("密码修改成功");                  	
                   	window.location.href="index.jsp";
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
})
</script>
<body>
	<h2>修改您的密码</h2>
	<form>
		用户名：
		<input type="text" id="account"/>
		密码：
		<input type="password" id="pwd"/>
		新密码：
		<input type="password" id="newpwd"/>
	</form>
	<button id="changePwd">提交</button>
</body>
</html>