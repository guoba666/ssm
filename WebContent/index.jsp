<%@ page language="java" contentType="text/html; charset=utf-8"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Insert title here</title>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/loginstyle.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script src="js/loginjs.js"></script>
</head>
<script type="text/javascript" language="JavaScript">
$(document).ready(function () {
    
    $("#checkRecord").click(function(){
		window.location.href="success";
	})
	
	$("#toChangePwd").click(function(){
		window.location.href="toChangePwd";
	})
   
	 $('#register').click(function () {
        $.ajax({
            type: "post",
            url: "/ssm/register",
            data: {
                "account": $("#Resaccount").val(),
                "pwd": $("#Respwd").val(),
            },
            dataType: "JSON",
            async: false,
            
            success: function (message) {
                if (message == -1) {
                    alert("提交信息有误");
 					
                }
                else if(message == 1){
                    alert("注册成功！");
                    location="login.jsp";
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
			<div class="container">
				<div>
					<center>
					<h1>学校评价系统</h1>
					<h2>Multi-dimensional Student Accessment System</h2>
					</center>
				</div>
				<div class="form">
					<div class="row">
						<div class="col-lg-1"></div>
						<div class="col-lg-5">
							<select id="province" class="form-control input-lg">
								<option value="0">-请选择省份-</option>
							</select>
						</div>
						<div class="col-lg-5">
							<select id="city" class="form-control input-lg">
								<option value="0">-请选择城市-</option>
							</select>
						</div>
						<div class="col-lg-1"></div>
					</div>
					
					<div class="row">
						<div class="col-lg-1"></div>
						<div class="col-lg-10">
							<select id="school" class="form-control input-lg">
								<option value="0">-请选择学校-</option>
							</select>
						</div>
						<div class="col-lg-1"></div>
					</div>
					
					<div class="row">
						<div class="col-lg-1"></div>
						<div class="col-lg">
							<input class="input-lg" type="text" id="account" name="account"/><span class="userInfo" id="userInfo">用户名</span>
						</div>
						<div class="col-lg-1"></div>
					</div>
					
					<div class="row">
						<div class="col-lg-1"></div>
						<div class="col-lg">
							<input class="input-lg" type="password" id="pwd" name="pwd"/><span class="pwdInfo" id="pwdInfo">密码</span>
						</div>
						<div class="col-lg-1"></div>
					</div>
					
					<a class="btn login-bt" id="login-bt" href="#">登陆</a>
				</div>
			</div>
		</center>
	</body>
</body>
</html>