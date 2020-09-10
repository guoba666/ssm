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
<style>
		#send_btn{
			background-color:rgb(44, 62, 80);
			color: white;
			margin-left: -40px;
			margin-top:10px;
			margin-bottom: 20px;
		}
		#send_btn:hover{
			background-color:#286090;
		}
	</style>
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
				<a href="history.html" cid="2" id="history_eval"><span>历史评价</span>
					<div class="hide_div" id="hide_d2">
						<a href="informs.html"><span>历史通知</span></a>
						<a href="teacherMessage.html"><span>老师消息</span></a>
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
						<a href="#"><span>班级管理</span></a>
						<a href="#"><span>老师管理</span></a>
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
			
			<div style="height: 12px;"></div>
			<div class="phead">
				<span>老师消息</span>
			</div>
			
			<div class="pbody">
				<ul id="myTab" class="nav nav-tabs" style="background-color: white;">
					<li class="active">
						<a href="#t1" data-toggle="tab">
							发送消息
						</a>
					</li>
					<li><a href="#t2" data-toggle="tab">查看消息</a></li>
				</ul>
				<!--分页内容-->
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade in active" id="t1">
						<div class="row">
							<div class="col-lg-4">
								<div>
									<span>选择发送老师</span>
									<div class="radio myradio">
										<label><input type="radio" name="option" id="option1"/>班主任</label>
									</div>
									<div class="radio myradio">
										<label><input type="radio" name="option" id="option2"/>所有老师</label>
									</div>
								</div>
							</div>
							<div class="col-lg-8">
								<span style="margin-left:-30px">通知内容</span>
								<textarea rows="6" cols="80"></textarea>
								<button id="send_btn" type="button" class="btn btn-default">发送通知</button>
							</div>
						</div>
					</div>
					
					<div class="tab-pane fade" id="t2">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>接收人</th>
										<th>消息内容</th>
										<th>发送时间</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		
</body>
</html>