$(function(){
			$("div.nav a").mouseenter(function(){
				var cid =$(this).attr("cid");
				
				$("#hide_d"+cid).slideDown();
				
				$("div.nav a[cid="+cid+"]").mouseleave(function(){
					$("#hide_d"+cid).hide();
				})
				$("#hide_d"+cid).mouseenter(function(){
					$(this).show();
				})
				$("#hide_d"+cid).mouseleave(function(){
					$(this).hide();
				})
			})
		})