<%@ page language="java" contentType="text/html; charset=utf-8"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Insert title here</title>
	<script src="js/jquery.min.js"></script>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/mystyle.css">
	<script src="js/myjs.js"></script>
</head>
<body>
	<div class="head">
			<span class="school_name">北京师范大学珠海分校</span>
			<div class="user_info pull-right">
				<span class="wel_info">欢迎</span>
				<span class="user_id">管理员</span>
			</div>
		</div>
		<div class="body_div">
			<div class="nav">
				<a href="#" cid="1" id="teacher_score"><span>老师积分</span>
					<div class="hide_div" id="hide_d1">
						<a href="#"><span>往期积分</span></a>
					</div>
				</a>
				<a href="#"><span>家庭积分</span></a>
				<a href="history" cid="2" id="history_eval"><span>历史评价</span>
					<div class="hide_div" id="hide_d2">
						<a href="informs"><span>历史通知</span></a>
						<a href="teacherMessage"><span>老师消息</span></a>
						<a href="#"><span>审核情况</span></a>
					</div>
				</a>
				<a href="#" cid="3"><span>评价统计</span>
					<div class="hide_div" id="hide_d3">
						<a href="#"><span>科目统计</span></a>
						<a href="#"><span>素养统计</span></a>
						<a href="#"><span>班级统计</span></a>
					</div>
				</a>
				<a href="#"><span>排行榜</span></a>
				<a href="#" cid="4"><span>基础数据</span>
					<div class="hide_div" id="hide_d4">
						<a href="#"><span>学校管理</span></a>
						<a href="#"><span>评价管理</span></a>
						<a href="class"><span>班级管理</span></a>
						<a href="teacher"><span>老师管理</span></a>
						<a href="#"><span>学生管理</span></a>
						<a href="#"><span>招生管理</span></a>
						<a href="#"><span>社团管理</span></a>
						<a href="#"><span>社团招新</span></a>
					</div>
				</a>
				<a href="#" cid="5"><span>期末评语</span>
					<div class="hide_div" id="hide_d5">
						<a href="#"><span>录入成绩</span></a>
						<a href="#"><span>评语汇总</span></a>
					</div>
				</a>
			</div>
			
			<div class="option_div">
				<span>年级</span>
				<select id="grade" onchange="getGrade(this)">
					<option value="0">请选择年级</option>
					<option value="1">一年级</option>
					<option value="2">二年级</option>
					<option value="3">三年级</option>
					<option value="4">四年级</option>
					<option value="5">五年级</option>
					<option value="6">六年级</option>
				</select>
				<span>班级</span>
				<select id="classes">
					<option value="0">请选择班级</option>
				</select>
				<span>周次</span>
				<select id="weeks">
					<option value="0">请选择周次</option>
					<script>
						for(var k=1;k<=33;k++){
							var ch = document.createElement("option");
							var f = document.getElementById("weeks");
							ch.innerHTML=k;
							ch.value=k;
							if(k==1){
								ch.selected=true;
							}
							f.appendChild(ch);
						}
					</script>
				</select>
			</div>
			<div style="height: 12px;"></div>
			<div class="phead">
				<span>历史评价</span>
			</div>
			<div class="pbody">
				<div class="informs_check">
					<span class="glyphicon glyphicon-comment"></span>
					<a href="informs.html">通知/奖励/惩罚查看</a>
				</div>
				<div style="clear: both;"></div>
			</div>
		</div>
</body>
<script>
var classes=[
	["一班"],
	["一班","二班"],
	["一班"],
	["一班"],
	["一班","二班","三班"],
	["一班","二班"]
]
function getGrade(x){
	var val = x.value;
	var c = document.getElementById("classes");
	if(c.length>1){
		c.length=1;
	}
	var child = document.createElement("option");
	child.value = 1;
	child.innerHTML=classes[val-1][0];
	child.selected=true;
	c.appendChild(child);
	
	for(var i=1;i<classes[val-1].length;i++){
		child = document.createElement("option");
		child.value = i+1;
		child.innerHTML=classes[val-1][i];
		c.appendChild(child);
	}
}
</script>
</html>