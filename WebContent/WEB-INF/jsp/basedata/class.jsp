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
				<span>年级</span>
				<select id="selectByGrade" onchange="getGrade(this)">
					<option value="0">全校</option>
				</select>
				<div id="ClassOperateArea">
					<button class="btn btn-sm btn-info" id="upgradeClass-btn">
						<span class="glyphicon glyphicon-plus"></span> 班级升级
					</button>
					<button class="btn btn-sm" id="addClass-btn" data-toggle="modal" data-target="#addClassModal">
						<span class="glyphicon glyphicon-plus"></span> 新增班级
					</button>
				</div>
			</div>
			<div style="height: 12px;"></div>
			<div class="phead">
				<span>班级信息</span>
			</div>
			<div class="pbody">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>年级号</th>
							<th>年级名称</th>
							<th>班级号</th>
							<th>班级名称</th>
							<th>教师</th>
							<th>学生</th>
							<th>操作</th>
						</tr>
					</thead>
					<!-- 用JS获取数据并构建表格内容-->
					<tbody id="classDisplayArea">
						<!--  
						<tr id="classT1">
							<td name="gradeNumber">5</td>
							<td name="gradeName">五年级</td>
							<td name="classNumber">1</td>
							<td class="classInputTd">
								<input class="tableInput" value="2班" disabled="true"/>
							</td>
							<td>
								<button class="btn btn-xs btn-info glyphicon glyphicon-user" title="任课老师">
								</button>
							</td>
							<td>
								<button class="btn btn-xs btn-success glyphicon glyphicon-th-list" title="学生信息">
								</button>
							</td>
							<td>
								<button class="btn btn-xs btn-primary glyphicon glyphicon-pencil" value="1" title="编辑" id="classAlter1">
								</button>
								<button class="btn btn-xs btn-danger glyphicon glyphicon-remove" value="1" title="删除" id="classDelete1">
								</button>
								<button class="btn btn-xs btn-success glyphicon glyphicon-saved" value="1" title="保存" id="classSave1">
								</button>
								<button class="btn btn-xs btn-warning glyphicon glyphicon-minus-sign" value="1" title="取消" id="classCancel1">
								</button>
							</td>
						</tr>
						<tr id="classT2">
							<td name="gradeNumber">2</td>
							<td name="gradeName">二年级</td>
							<td name="classNumber">3</td>
							<td class="classInputTd">
								<input class="tableInput" value="3班" disabled="true"/>
							</td>
							<td>
								<button class="btn btn-xs btn-info glyphicon glyphicon-user" title="任课老师">
								</button>
							</td>
							<td>
								<button class="btn btn-xs btn-success glyphicon glyphicon-th-list" title="学生信息">
								</button>
							</td>
							<td>
								<button class="btn btn-xs btn-primary glyphicon glyphicon-pencil" value="2" title="编辑" id="classAlter2">
								</button>
								<button class="btn btn-xs btn-danger glyphicon glyphicon-remove" value="2" title="删除" id="classDelete2">
								</button>
								<button class="btn btn-xs btn-success glyphicon glyphicon-saved" value="2" title="保存" id="classSave2">
								</button>
								<button class="btn btn-xs btn-warning glyphicon glyphicon-minus-sign" value="2" title="取消" id="classCancel2">
								</button>
							</td>
						</tr>
						-->
						<!-- 从后台读取班级列表 -->
						<c:forEach items="${classList}" var="c" varStatus="status">
        					<tr id="classT${status.count+2}">
            					<td name="gradeNumber">${c.gradeNumber}</td>
           						<td name="gradeName">${c.gradeName}</td>
           						<td name="classNumber">${c.classNumber}</td>
           						<td class="classInputTd">
           							<input class="tableInput" value="${c.className}" disabled="true"/>
           						</td>
           						<td>
									<button class="btn btn-xs btn-info glyphicon glyphicon-user" title="任课老师">
									</button>
								</td>
								<td>
									<button class="btn btn-xs btn-success glyphicon glyphicon-th-list" title="学生信息">
									</button>
								</td>
								<td>
									<button class="btn btn-xs btn-primary glyphicon glyphicon-pencil" value="${status.count+2}" title="编辑" id="classAlter${status.count+2}">
									</button>
									<button class="btn btn-xs btn-danger glyphicon glyphicon-remove" value="${status.count+2}" title="删除" id="classDelete${status.count+2}">
									</button>
									<button class="btn btn-xs btn-success glyphicon glyphicon-saved" value="${status.count+2}" title="保存" id="classSave${status.count+2}">
									</button>
									<button class="btn btn-xs btn-warning glyphicon glyphicon-minus-sign" value="${status.count+2}" title="取消" id="classCancel${status.count+2}">
									</button>
								</td>
       						</tr>
    					</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- 分页查询 -->
			<div id="pageNav">
				<ul id="pageUl">
					<li>
						<a id="previousPage" class="btn btn-sm btn-info glyphicon glyphicon-chevron-left" href="?start=${page.start-page.count}"></a>
					</li>
					<li id="currentPage">
						<fmt:formatNumber type="number" value="${page.start/8+1}" maxFractionDigits="0"/>
					</li>
					<li>
						<a id="nextPage" class="btn btn-sm btn-info glyphicon glyphicon-chevron-right" href="?start=${page.start+page.count}"></a>
					</li>
				</ul>
			 </div>
		</div>
		<!-- 班级添加模态框 -->
		<div class="modal fade" id="addClassModal" tabindex="-1" aria-labelledby="ClassModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="TeacherModalLabel">
							新增班级
						</h4>
					</div>
					<div class="modal-body">
						<ul id="AddClassTab" class="nav nav-tabs" style="background-color: white;">
							<li class="active">
								<a href="#t1" data-toggle="tab" id="addClassOne-a">
									添加单个
								</a>
							</li>
							<li>
								<a href="#t2" data-toggle="tab" id="addClassAll-a">
									添加多个
								</a>
							</li>
						</ul>
						<!-- 分页内容 -->
						<div id="addClassTabContent" class="tab-content">
							<div class="tab-pane fade in active" id="t1">
								<div class="row">
									<div class="col-lg-4"></div>
									<div class="col-lg-2">
										<span>年级</span>
									</div>
									<div class="col-lg-2">
										<select id="oneGradeSelect" class="form-control">
											<option value="0">请选择</option>
										</select>
									</div>
									<div class="col-lg-4"></div>
								</div>
								<div class="row">
									<div class="col-lg-4"></div>
									<div class="col-lg-2">
										<span>班级</span>
									</div>
									<div class="col-lg-2">
										<select id="oneClassSelect" class="form-control">
											<option value="0">请选择</option>
										</select>
									</div>
									<div class="col-lg-4"></div>
								</div>
								<div class="row">
									<div class="col-lg-4"></div>
									<div class="col-lg-2">
										<span>已选</span>
									</div>
									<div class="col-lg-4">
										<span id="addClassResult"></span>
										<input id="addClassName"/>
									</div>
									<div class="col-lg-2"></div>
								</div>
							</div>
							<div class="tab-pane fade" id="t2">
								<div class="row">
									<div class="col-lg-2">
										<span>选择年级</span>
									</div>
									<div class="col-lg-2">
										<select id="allGradeSelect" class="form-control">
											<option value="0">请选择</option>
										</select>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-2">
										<span>选择班级</span>
									</div>
									<div class="col-lg-5"></div>
									<div class="col-lg-2">
										<span>已选班级</span>
									</div>
									<div class="col-lg-2"></div>
								</div>
								<div class="row">
									<div class="col-lg-4">
										<select id="allClassSelect" class="form-control" multiple="true">
											
										</select>
									</div>
									<div class="col-lg-2">
										<button class="btn btn-xs btn-success" id="addClass-btn-add">
											添加 <span class="glyphicon glyphicon-forward"></span>
										</button>
										<button class="btn btn-xs btn-danger" id="addClass-btn-delete">
											<span class="glyphicon glyphicon-backward"></span> 移除
										</button>
									</div>
									<div class="col-lg-4">
										<select id="allClassResult" class="form-control" multiple="true">
											
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="addClassOne-btn">添加</button>
						<button type="button" class="btn btn-primary" id="addClassAll-btn">全部添加</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
</body>
</html>