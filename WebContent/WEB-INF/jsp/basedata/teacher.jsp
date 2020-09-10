<%@ page language="java" contentType="text/html; charset=utf-8"
 pageEncoding="UTF-8" import="com.how2java.pojo.*" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<script src="js/classjs.js"></script>
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
				<a href="../history.html" cid="2" id="history_eval"><span>历史评价</span>
					<div class="hide_div" id="hide_d2">
						<a href="../informs.html"><span>历史通知</span></a>
						<a href="../teacherMessage.html"><span>老师消息</span></a>
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
				<input placeholder="请输入老师姓名" id="teacherSeach-content"/>
				<button class="btn btn-xs" id="teacherSeach-btn">
					<span class="glyphicon glyphicon-search"></span>
				</button>
				<div id="TeacherOperateArea">
					<button class="btn btn-sm" id="addTeacher-btn" data-toggle="modal" data-target="#addTeacherModal">
						<span class="glyphicon glyphicon-plus"></span> 新增教师
					</button>
					<input type="file" id="uploadTeacher"/>
					<a id="downloadTeacher">
						<span class="glyphicon glyphicon-save"></span>下载模板
					</a>
				</div>
			</div>
			<div style="height: 12px;"></div>
			<div class="phead">
				<span>老师信息</span>
			</div>
			<div class="pbody">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>教师姓名</th>
							<th>联系电话</th>
							<th>办公室</th>
							<th>职称</th>
							<th>身份证后六位</th>
							<th>科目</th>
							<th>班级</th>
							<th>操作</th>
						</tr>
					</thead>
					<!-- 用JS获取数据并构建表格内容-->
					<tbody>
						<tr>
							<td>锅巴</td>
							<td>13733333321</td>
							<td>木铎</td>
							<td>教师</td>
							<td>123456</td>
							<td>
								<button class="btn btn-xs btn-info">
									<span class="glyphicon glyphicon-th-list"></span>
								</button>
							</td>
							<td>
								<button class="btn btn-xs btn-success">
									<span class="glyphicon glyphicon-bell"></span>
								</button>
							</td>
							<td>
								<button class="btn btn-xs btn-warning">
									<span class="glyphicon glyphicon-repeat"></span>
								</button>
								<button class="btn btn-xs btn-primary">
									<span class="glyphicon glyphicon-pencil"></span>
								</button>
								<button class="btn btn-xs btn-danger">
									<span class="glyphicon glyphicon-remove"></span>
								</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 模态框-->
		<div class="modal fade" id="addTeacherModal" tabindex="-1" aria-labelledby="TeacherModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="TeacherModalLabel">
							新增教师
						</h4>
					</div>
					<div class="modal-body">
						<ul id="AddTeacherTab" class="nav nav-tabs" style="background-color: white;">
							<li class="active">
								<a href="#t1" data-toggle="tab">
									添加单个
								</a>
							</li>
							<li>
								<a href="#t2" data-toggle="tab">
									添加多个
								</a>
							</li>
						</ul>
						<!-- 分页内容 -->
						<div id="AddTeacherTabContent" class="tab-content">
							<div class="tab-pane fade in active" id="t1">
								<div class="row">
									<div class="col-lg-1"></div>
									<div class="col-lg-2">
										<span>教师姓名</span><span style="color:red;">*</span>
									</div>
									<div class="col-lg-1"></div>
									<div class="col-lg-5">
										<input class="form-control" name="techerName" type="text" placeholder="教师姓名"/>
									</div>
									<div class="col-lg-1"></div>
								</div>
								<div class="row">
									<div class="col-lg-1"></div>
									<div class="col-lg-2">
										<span>联系电话</span>
									</div>
									<div class="col-lg-1"></div>
									<div class="col-lg-5">
										<input class="form-control" name="teacherTel" type="text" maxlength="11" placeholder="联系电话"/>
									</div>
									<div class="col-lg-1"></div>
								</div>
								<div class="row">
									<div class="col-lg-1"></div>
									<div class="col-lg-2">
										<span>办公室</span>
									</div>
									<div class="col-lg-1"></div>
									<div class="col-lg-5">
										<input class="form-control" name="teacherOffice" type="text" placeholder="办公室"/>
									</div>
									<div class="col-lg-1"></div>
								</div>
								<div class="row">
									<div class="col-lg-1"></div>
									<div class="col-lg-2">
										<span>职称</span>
									</div>
									<div class="col-lg-1"></div>
									<div class="col-lg-5">
										<input class="form-control" name="teacherJob" type="text" placeholder="职称"/>
									</div>
									<div class="col-lg-1"></div>
								</div>
								<div class="row">
									<div class="col-lg-1"></div>
									<div class="col-lg-2">
										<span>身份证号</span><span style="color:red;">*</span>
									</div>
									<div class="col-lg-1"></div>
									<div class="col-lg-5">
										<input class="form-control" name="teacherId" type="text" maxlength="6" placeholder="身份证号后六位"/>
									</div>
									<div class="col-lg-1"></div>
								</div>
							</div>
							<div class="tab-pane fade" id="t2">
								<div id="txtArea">
									<div class="row">
										<div class="col-lg-1"></div>
										<div class="col-lg-5">
											<span>教师姓名</span><span style="color:red;">*</span>
										</div>
										<div class="col-lg-5">
											<span>身份证号</span><span style="color:red;">*</span>
										</div>
										<div class="col-lg-1"></div>
									</div>
									<div class="row">
										<div class="col-lg-1"></div>
										<div class="col-lg-5">
											<input type="text" class="form-control" name="teacherName" placeholder="教师姓名"/>
										</div>
										<div class="col-lg-5">
											<input type="text" class="form-control" name="teacherId" maxlength="6" placeholder="身份证号(后6位)"/>
										</div>
										<div class="col-lg-1"></div>
									</div>
								</div>
								<div style="margin: 50px;">
									<button class="btn btn-xs btn-success glyphicon glyphicon-plus" id="addTeacher-btn-add">
									</button>
									<button class="btn btn-xs btn-danger glyphicon glyphicon-minus" id="addTeacher-btn-delete">
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary">添加</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
</body>
<script>
		$(function(){
			
			//设置计时器每0.1秒检查添加多个教师的数量,如果等于10则不能继续添加,等于1则不能继续删除
			setInterval(function(){
				if($("#txtArea").children().length==11){
					$("#addTeacher-btn-add").prop("disabled",true);
				}else{
					$("#addTeacher-btn-add").prop("disabled",false);
				}
				if($("#txtArea").children().length==2){
					$("#addTeacher-btn-delete").prop("disabled",true);
				}else{
					$("#addTeacher-btn-delete").prop("disabled",false);
				}
			},100);
			$("#addTeacher-btn-add").click(function(){
				var $txtArea=$("#txtArea");
				var $row = $("<div class='row'></div>");
				var $col1=$("<div class='col-lg-1'></div>");
				var $col2=$("<div class='col-lg-5'></div>");
				var $col3=$("<div class='col-lg-5'></div>");
				var $col4=$("<div class='col-lg-1'></div>");
				var $nameInput=$("<input type='text' class='form-control' name='teacherName' placeholder='教师姓名'/>");
				var $idInput=$("<input type='text' class='form-control' name='teacherId' maxlength='6' placeholder='身份证号(后6位)'/>");
				$col2.append($nameInput);
				$col3.append($idInput);
				$row.append($col1);
				$row.append($col2);
				$row.append($col3);
				$row.append($col4);
				$txtArea.append($row);
			})
			$("#addTeacher-btn-delete").click(function(){
				$("#txtArea").children(":last").remove();
			})
		})
</script>
</html>