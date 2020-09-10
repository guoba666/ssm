$(function(){
	var grade=[
		"小班","中班","大班",
		"一年级","二年级","三年级","四年级","五年级","六年级","初一","初二","初三",
		"高一","高二","高三"
	];
	var ChineseNumber=[
		"一","二","三","四","五","六","七","八","九","十","十一","十二","十三","十四","十五"
	];
	
	var currentPageCount=1;   //当前页面
	var totalPageCount=0;	//总页数
	

	//查询班级
	function selectClass(classList){
		var $tbody=$("#classDisplayArea");
		$tbody.empty();
		for(var i=1;i<=classList.length;i++){
			var $tr=$("<tr id='classT"+i+"'></tr>");
			
			var $td1=$("<td name='gradeNumber'></td>");
			$td1.text(classList[i-1].gradeNumber);
			$tr.append($td1);
			
			var $td2=$("<td name='gradeName'></td>");
			$td2.text(classList[i-1].gradeName);
			$tr.append($td2);
			
			var $td3=$("<td name='classNumber'></td>");
			$td3.text(classList[i-1].classNumber);
			$tr.append($td3);
			
			var $td4=$("<td class='classInputTd'></td>");
			var $input=$("<input class='tableInput' disabled='true' />");
			$input.val(classList[i-1].className);
			$td4.append($input);
			$tr.append($td4);
			
			$tr.append("<td><button class='btn btn-xs btn-info glyphicon glyphicon-user' title='任课老师'></button></td>");
			$tr.append("<td><button class='btn btn-xs btn-success glyphicon glyphicon-th-list' title='学生信息'></button></td>");
			
			var $td7=$("<td></td>");
			var $btn1=$("<button class='btn btn-xs btn-primary glyphicon glyphicon-pencil' title='编辑' id='classAlter"+i+"' value='"+i+"'></button>");
			var $btn2=$("<button class='btn btn-xs btn-danger glyphicon glyphicon-remove' title='删除' id='classDelete"+i+"' value='"+i+"'></button>");
			var $btn3=$("<button class='btn btn-xs btn-success glyphicon glyphicon-saved' title='保存' id='classSave"+i+"' value='"+i+"'></button>");
			var $btn4=$("<button class='btn btn-xs btn-warning glyphicon glyphicon-minus-sign' title='取消' id='classCancel"+i+"' value='"+i+"'></button>");
			$td7.append($btn1);
			$td7.append($btn2);
			$td7.append($btn3);
			$td7.append($btn4);
			$tr.append($td7);
			
			$tbody.append($tr.fadeIn());
		}
	}
	//根据年级选择班级
	var $selectByGrade=$("#selectByGrade");
	for(var i=1;i<=15;i++){
		var op = $("<option value="+i+">"+grade[i-1]+"</option>");
		$selectByGrade.append(op);
	}
	$selectByGrade.change(function(){
		
			$.ajax({
				type:"post",
				url:"/ssm/class/selectByGrade",
				data:{
					"gradeNumber":$(this).val()
				},
				dataType:"JSON",
				success:function(classList){
					selectClass(classList);
				},
				error: function (XMLHttpRequest, textStatus, errorThrown) {
					alert("提交失败");
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
				}
			})
		
		
	})
	//添加单个班级
	var $oneGradeSelect=$("#oneGradeSelect");
	for(var i=1;i<=15;i++){
		var op = $("<option value="+i+">"+grade[i-1]+"</option>");
		$oneGradeSelect.append(op);
	}
	var $oneClassSelect=$("#oneClassSelect");
	for(var i=1;i<=15;i++){
		var op = $("<option value="+i+">"+i+"</option>");
		$oneClassSelect.append(op);
	}
	$oneGradeSelect.change(function(){
		$("#addClassResult").text(grade[$("#oneGradeSelect").val()-1]);
	})
	$oneClassSelect.change(function(){
		$("#addClassName").css("display","inline-block");
		$("#addClassName").val(ChineseNumber[$(this).val()-1]+"班");
	})
	
	//添加多个班级框
	var $allGradeSelect=$("#allGradeSelect");  //年级选项
	for(var i=1;i<=15;i++){
		var op =$("<option value="+i+">"+grade[i-1]+"</option>");
		$allGradeSelect.append(op);
	}
	var $allClassSelect=$("#allClassSelect"); //班级选项列表
	for(var i=1;i<=15;i++){
		var op = $("<option value="+i+">"+i+"</option>");
		$allClassSelect.append(op);
	}
	
	//点击添加多个时,隐藏“添加”按钮,显示“全部添加”按钮
	$("a#addClassOne-a").click(function(){
		$("#addClassOne-btn").show();
		$("#addClassAll-btn").hide();
	})
	$("a#addClassAll-a").click(function(){
		$("#addClassOne-btn").hide();
		$("#addClassAll-btn").show();
	})
	
	//添加多个班级按钮
	$("#addClass-btn-add").click(function(){
		var $allClassResult=$("#allClassResult"); //右边的select
		if($allGradeSelect.val()==0){
			alert("请先选择年级!")
		}else if($("#allClassSelect option:selected").length==0){
			alert("请选择班级!");
		}else{
			var selectArray=$("#allClassSelect option:selected");
			selectArray.each(function(){
				var $resultOp=$("<option value="+$(this).val()+"></option>");
				$resultOp.attr("gradeNumber",$allGradeSelect.val());
				$resultOp.attr("classNumber",$(this).val());
				$resultOp.text(grade[$allGradeSelect.val()-1]+(ChineseNumber[($(this).val())-1])+"班");
				$allClassResult.append($resultOp);
			})
			selectArray.remove();
		}
	})
	//移除多个班级按钮
	$("#addClass-btn-delete").click(function(){
		var $allClassResult=$("#allClassResult"); //右边的select
		var selectArray=$("#allClassResult option:selected");
		selectArray.each(function(){
			var selectOp=$("<option value="+$(this).val()+"></option>");
			selectOp.text($(this).val());
			$allClassSelect.append(selectOp);
		})
		selectArray.remove();
	})
	
	//选择不同年级刷新班级排列
	$allGradeSelect.change(function(){
		$allClassSelect.empty();
		for(var i=1;i<=15;i++){
			var op = $("<option value="+i+">"+i+"</option>");
			$allClassSelect.append(op);
		}
	})
	
	//班级升级
	$("#upgradeClass-btn").click(function(){
		if(confirm("确定要对所有班级进行升级操作吗?")){
			$("td[name='gradeNumber']").each(function(){
				var grade=parseInt($(this).text())+1;
				$(this).text(grade);
			})
		}
	})
	
	//班级修改
	$("tbody#classDisplayArea").on("click","button[id^='classAlter']",function(){
		var index=$(this).prop("id").split("classAlter")[1];
		var b='button[value='+index+']';
		$(this).parents("tbody").find("button:not("+b+")").prop("disabled",true);
		$(this).parents("tbody").find("button:not("+b+")").css("background-color","gray");
		$(this).hide();
		$(this).siblings("button#classDelete"+index).hide();
		$(this).siblings("button#classSave"+index).show();
		$(this).siblings("button#classCancel"+index).show();
		var $input=$(this).parent().siblings("td.classInputTd").find("input");
		$input.prop("disabled",false);
		$input.css("border","1px solid rgb(204, 204, 204)");
	})
	//取消修改
	$("tbody#classDisplayArea").on("click","button[id^='classCancel']",function(){
		var index=$(this).prop("id").split("classCancel")[1];
		$(this).parents("tbody").find("button").prop("disabled",false);
		$(this).parents("tbody").find("button").css("background-color","");
		$(this).hide();
		$(this).siblings("button#classDelete"+index).show();
		$(this).siblings("button#classSave"+index).hide();
		$(this).siblings("button#classAlter"+index).show();
		var $input=$(this).parent().siblings("td.classInputTd").find("input");
		$input.prop("disabled",false);
		$input.css("border","none");
	})
	
	//保存修改
	$("tbody#classDisplayArea").on("click","button[id^='classSave']",function(){
		var index=$(this).prop("id").split("classSave")[1];
		$(this).parents("tbody").find("button").prop("disabled",false);
		$(this).parents("tbody").find("button").css("background-color","");
		$(this).hide();
		$(this).siblings("button#classDelete"+index).show();
		$(this).siblings("button#classCancel"+index).hide();
		$(this).siblings("button#classAlter"+index).show();
		var $input=$(this).parent().siblings("td.classInputTd").find("input");
		$input.prop("disabled",true);
		$input.css("border","none");
		$input.val($input.val());
		var gradeNumber=$(this).parent().parent().find("td[name='gradeNumber']").text();
		var classNumber=$(this).parent().parent().find("td[name='classNumber']").text();
		//接下来还要通过ajax对服务器后台数据修改
		$.ajax({
			type:"post",
			url:"/ssm/class/alterOneClass",
			data:{
				"className":$input.val(),
				"classId":gradeNumber+classNumber
			},
			success:function(){},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("提交失败");
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
            }
		})
	})
	
	//删除班级
	$("tbody#classDisplayArea").on("click","button[id^='classDelete']",function(){
		var index=$(this).prop("id").split("classDelete")[1];
		var $input=$(this).parent().siblings("td.classInputTd").find("input");
		var gradeVal=$("#classT"+index).find("td[name='gradeNumber']").text();
		var classVal=$("#classT"+index).find("td[name='classNumber']").text();
		if($input.val()==prompt("请输入班级名称确认")){
			//修改数据库
			$.ajax({
				type:"post",
				url:"/ssm/class/deleteOneClass",
				data:{
					"classId":gradeVal+classVal
				},
				dataType:"JSON",
				success:function(message){
					if(message==1){
						alert("删除成功!");
						classRefresh();
					}else{
						alert("删除失败！");
					}
				},
				error: function (XMLHttpRequest, textStatus, errorThrown) {
					alert("提交失败");
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
				}
			})
			
		}else{
			alert("输入的班级名称与选择不符,删除失败！");
		}
	})

	//添加单个班级
	$("#addClassOne-btn").click(function(){
		var gradeVal=$("#oneGradeSelect").val();
		var classVal=$("#oneClassSelect").val();
		//后台操作
		$.ajax({
			type:"post",
			url:"/ssm/class/addOneClass",
			data:{
				"classId":gradeVal+classVal,
				"gradeNumber":gradeVal,
				"gradeName":$("#addClassResult").text(),
				"classNumber":classVal,
				"className":$("#addClassName").val()
			},
			dataType:"JSON",
			async: false,
            success: function (message) {
                if (message == 1) {
                    alert("添加成功");
                    classRefresh();
                    $("#addClassModal").modal("hide");
            		$(".modal-backdrop").remove();
                }
                else if(message==-1){
					alert("班级已存在,添加失败!");
				}
                else{
					alert("系统繁忙");
				}
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("提交失败");
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
            }
		})
	})
	
	//获取分页查询总页数
	function getTotalPageCount(){
		$.ajax({
			type:"post",
			url:"/ssm/class/getTotalPageCount",
			data:{
				
			},
			dataType:"JSON",
			success:function(count){
				totalPageCount=count;
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				alert("提交失败");
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
			}
		})
	}
	
	//刷新班级
	function classRefresh(){
		$.ajax({
			type:"post",
			url:"/ssm/class/classRefresh",
			data:{
				
			},
			dataType:"JSON",
			success:function(classList){
				var $tbody=$("#classDisplayArea");
				$tbody.empty();
				for(var i=1;i<=classList.length;i++){
					var $tr=$("<tr id='classT"+i+"'></tr>");
					
					var $td1=$("<td name='gradeNumber'></td>");
					$td1.text(classList[i-1].gradeNumber);
					$tr.append($td1);
					
					var $td2=$("<td name='gradeName'></td>");
					$td2.text(classList[i-1].gradeName);
					$tr.append($td2);
					
					var $td3=$("<td name='classNumber'></td>");
					$td3.text(classList[i-1].classNumber);
					$tr.append($td3);
					
					var $td4=$("<td class='classInputTd'></td>");
					var $input=$("<input class='tableInput' disabled='true' />");
					$input.val(classList[i-1].className);
					$td4.append($input);
					$tr.append($td4);
					$tr.append("<td><button class='btn btn-xs btn-info glyphicon glyphicon-user' title='任课老师'></button></td>");
					$tr.append("<td><button class='btn btn-xs btn-success glyphicon glyphicon-th-list' title='学生信息'></button></td>");
					
					var $td7=$("<td></td>");
					var $btn1=$("<button class='btn btn-xs btn-primary glyphicon glyphicon-pencil' title='编辑' id='classAlter"+i+"' value='"+i+"'></button>");
					var $btn2=$("<button class='btn btn-xs btn-danger glyphicon glyphicon-remove' title='删除' id='classDelete"+i+"' value='"+i+"'></button>");
					var $btn3=$("<button class='btn btn-xs btn-success glyphicon glyphicon-saved' title='保存' id='classSave"+i+"' value='"+i+"'></button>");
					var $btn4=$("<button class='btn btn-xs btn-warning glyphicon glyphicon-minus-sign' title='取消' id='classCancel"+i+"' value='"+i+"'></button>");
					$td7.append($btn1);
					$td7.append($btn2);
					$td7.append($btn3);
					$td7.append($btn4);
					$tr.append($td7);
					
					$tbody.append($tr.fadeIn());
				}
			}
		})
	}
	
	//全部添加按钮
	$("#addClassAll-btn").click(function(){
		var count=0;//记录失败个数
		var $resultList = $("#allClassResult").children();
		$resultList.each(function(){
			var gradeVal=$(this).attr("gradeNumber");
			var classVal=$(this).attr("classNumber");
			var $this=$(this);
			$.ajax({
				type:"post",
				url:"/ssm/class/addOneClass",
				data:{
					"classId":gradeVal+classVal,
					"gradeNumber":gradeVal,
					"gradeName":grade[gradeVal-1],
					"classNumber":classVal,
					"className":ChineseNumber[classVal-1]+"班"
				},
				async: false,
				dataType:"JSON",
				success: function(message){
					if (message == 1) {
						$this.remove();
					}
					else if(message==-1){
						//index[count]=total;
						count++;
						$this.addClass("addFailed");
					}
					else{
						alert("系统繁忙");
					}
				},
				error: function (XMLHttpRequest, textStatus, errorThrown) {
					alert("提交失败");
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
				}
			})
		})
		if(count==0){
			alert("所有班级添加成功!");
			$("#addClassModal").modal("hide");
			$(".modal-backdrop").remove();
			classRefresh();
		}else{
			alert(count+"个班级添加失败!");
			classRefresh();
		}
	})
	
	/*
	$("button.btn.btn-xs.btn-info.glyphicon.glyphicon-user").click(function(){
		window.location="teacher";
	})
	*/
	$("#classDisplayArea").on("click","button.btn.btn-xs.btn-info.glyphicon.glyphicon-user",function(){
		window.location="teacher";
	})
	
})