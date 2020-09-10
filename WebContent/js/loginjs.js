$(function(){
			var provinces=[
				'北京','天津','河北','广东','内蒙古','辽宁','吉林','黑龙江','上海','江苏',
				'浙江','安徽','福建','江西','山东','河南','湖北','湖南','山西','广西','海南',
				'重庆','四川','贵州','云南','西藏','陕西','甘肃','青海','宁夏','新疆','台湾',
				'香港','澳门'
			];
			var cities=[
				['东城','西城','朝阳','丰台','石景山','海淀','门头沟','房山','通州','顺义','昌平','大兴','怀柔','平台','密云','延庆'],
				['和平','河东','河西','南开','河北','红桥','东丽 ','西青','津南','北辰','武清','宝坻','滨海新','宁河','静海'],
				['石家庄','唐山','秦皇岛','邯郸','刑台','保定','张家口','承德','沧州','廊坊','衡水'],
				['广州','韶关','深圳','珠海','汕头','佛山','江门','湛江','茂名','肇庆','惠州','梅州','汕尾','河源','阳江','清远','东莞','中山','潮州','揭阳','云浮']
			];
			var schools=[
				['广州市番禺区市桥沙墟第一小学','广州市番禺区市桥富都小学','广州市番禺区罗家桥虹小学','广州市番禺区市桥俊贤小学'],
				[],
				['深圳市宝安区坪洲小学'],
				['珠海市香洲区第一小学','珠海斗门区实验小学','珠海市金湾区航空新城小学','珠海市金湾区第一小学','珠海市香洲区第十小学','珠海市九洲中学','珠海市香洲区第六小学','珠海市高新区唐家小学','珠海北师大珠海分校'],
				[],
				['佛山市铁军小学','盐步中心小学','海北小学'],
				[],
				[],
				[],
				[],
				[],
				[],
				[],
				[],
				[],
				[],
				[],
				['中山市东升镇同乐小学'],
				[],
				[],
				[]
			];
			for(var i=0;i<provinces.length;i++){
				var childOption=$("<option value="+(i+1)+"></option").text(provinces[i]);
				$("#province").append(childOption);
			}
			
			$("#province").change(function(){
				var selectIndex=$(this).select().val();
				var cityArr=cities[selectIndex-1];
				var citySelect=$("#city");
				var len = citySelect[0].options.length;
				if(len>1){
					citySelect[0].options.length=1;
				}
				var childOption = $("<option value="+1+"></option").text(cityArr[0]);
				childOption.prop("selected",true);
				citySelect.append(childOption);
				for(var i=1;i<cityArr.length;i++){
					var childOption = $("<option value="+(i+1)+"></option").text(cityArr[i]);
					citySelect.append(childOption);
				}
				
			})
			
			$("#city").change(function(){
				var selectIndex=$(this).select().val();
				var schoolArr=schools[selectIndex-1];
				var schoolSelect=$("#school");
				var len = schoolSelect[0].options.length;
				if(len>1){
					schoolSelect[0].options.length=1;
				}
				var childOption = $("<option value="+1+"></option").text(schoolArr[0]);
				childOption.prop("selected","true");
				schoolSelect.append(childOption);
				for(var i=1;i<schoolArr.length;i++){
					var childOption = $("<option value="+(i+1)+"></option").text(schoolArr[i]);
					schoolSelect.append(childOption);
				}
			})
			
			$("#account").focus(function(){
				$("#userInfo").addClass("active");
			})
			$("#account").focusout(function(){
				if($("#account").val().length<=0){
					$("#userInfo").removeClass("active");
				}
			})
			$("#pwd").focus(function(){
				$("#pwdInfo").addClass("active");
			})
			$("#pwd").focusout(function(){
				if($("#pwd").val().length<=0){
					$("#pwdInfo").removeClass("active");
				}
			})
			
			
			$("#account").focusout(function(){
				if($(this).val().length==0){
					$("#userInfo").text("用户名不能为空");
					$("#userInfo").css("color","red");
				}else{
					$("#userInfo").text("用户名");
					$("#userInfo").css("color","green");
				}
			})
			
			$("#pwd").focusout(function(){
				if($(this).val().length==0){
					$("#pwdInfo").text("密码不能为空");
					$("#pwdInfo").css("color","red");
				}else{
					$("#pwdInfo").text("密码");
					$("#pwdInfo").css("color","green");
				}
			})
			
			$('#login-bt').click(function () {
				if($("#account").val().length>0 && $("#pwd").val().length>0){
					$.ajax({
						type: "post",
						url: "checklogin",
						data: {
							"account": $("#account").val(),
							"pwd": $("#pwd").val(),
						},
						dataType: "JSON",
						async: true,
						
						success: function (message) {
							if(message==0){
								alert("系统繁忙");
							}
							else if (message == 1) {
								//window.location.href="success?account="+$("#account").val();
								window.location.href="history";
							} else if(message == 2) {
								$("#userInfo").text("该用户不存在");
								$("#userInfo").css("color","red");
							}else{
								$("#pwdInfo").text("密码错误");
								$("#pwdInfo").css("color","red");
							}
						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
							alert("提交失败");
							alert(XMLHttpRequest.status);
							alert(XMLHttpRequest.readyState);
						}
					});
				}
				else{
					if($("#account").val().length==0){
						$("#userInfo").text("用户名不能为空");
						$("#userInfo").css("color","red");
						$("#userInfo").css("opacity","0.8");
					}
					if($("#pwd").val().length==0){
						$("#pwdInfo").text("密码不能为空");
						$("#pwdInfo").css("color","red");
						$("#pwdInfo").css("opacity","0.8");
					}
					
				}
			})
			
})