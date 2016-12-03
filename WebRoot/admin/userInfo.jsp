<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.marlon.bean.User"%>
<%@page import="com.marlon.dao.UserDao"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tz.tld" prefix="tz"%>
<!doctype html>
<html>
	<head>
		<!--声明当前页面的编码集：charset=gbk,gb2312(中文编码)，utf-8国际编码-->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<!--当前页面的三要素-->
		<title>VIP学员管理界面</title>
		<meta name="Keywords" content="关键词,关键词">
		<meta name="description" content="">
		<!--css,js-->
		<style type="text/css">
			*{margin:0px;padding:0px;}
			body{font-size:12px;font-family:微软雅黑;}
			.tz_table ul{width:100%;height:32px;text-aligin:center;line-height:32px;}
			.tz_table ul.tz_title{font-size:16px;font-weight:800;text-align: center;letter-spacing:1.6px;}
			.tz_table ul.tz_user_lists{text-indent:20px;font-size:16px;}
			.tz_table ul li{list-style-type:none;border:1px solid #111;float:left;}
			.tz_table ul li.tz_u-id{width:4%;}
			.tz_table ul li.tz_u-account{width:12%;}
			.tz_table ul li.tz_u-type{width:16%;}
			.tz_table ul li.tz_u-pay{width:10%;}
			.tz_table ul li.tz_u-contact{width:15%;}
			.tz_table ul li.tz_u-jointime{width:18%;}
			.tz_table ul li.tz_u-option{width:23%;}
			.tz_table ul li.tz_u-option a{text-decoration:none;display:block;width:28%;float:left;text-align:left;margin:0px 2%;font-size:16px;
				background:#4FE133;border-radius:6px;}
			.tz_table ul li.tz_u-option a:hover{background:pink;color:#141414;font-size:20px;}
			.clear{clear:both;}
			/*分页*/
			#page{margin:8px 0px 0px 710px;width: 465px;height: 40px;}
			#page .pagination{font-size:12px;}
			#page .pagination a{text-decoration:none;border:solid 1px #ccc;color:#999;}
			#page .pagination a,.pagination span{display:block;float:left;padding:0.3em 0.5em;margin-right:5px;margin-bottom:5px;min-width:1em;text-align:center;}
			#page .pagination .current{background:#999;color:#fff;border:solid 1px #ccc;}
			#page .pagination .current.prev,.pagination .current.next{color:#999;border-color:#999;background:#fff;}
			#page .tm_psize_go{padding:5px;margin-right:4px; float:left;height:25px;line-height:25px;position:relative;border:1px solid #ccc;}
			#page #tm_pagego{height:24px;line-height:24px;width:30px;float:left;text-align:center;border:1px solid #ccc;}
		</style>
		<link href="/marlon/css/layout.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="/marlon/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="/marlon/js/util.js"></script>
		<script type="text/javascript" src="/marlon/js/tmdrag.js"></script>
		<script type="text/javascript" src="/marlon/js/tmDialog.js"></script>
		<script type="text/javascript" src="/marlon/js/jquery.pagination.js"></script>
	</head>
<body>
	<div class="tz_table">
		<ul id="change_color" class="tz_title">
			<li class="tz_u-id">ID</li>
			<li class="tz_u-account">姓名</li>
			<li class="tz_u-type">班级类型</li>
			<li class="tz_u-pay">支付方式</li>
			<li class="tz_u-contact">联系方式</li>
			<li class="tz_u-jointime">报名时间</li>
			<li class="tz_u-option">操作</li>
		</ul>
		<div class="clear"></div>
		<ul class="tz_user_lists"></ul>
	</div>
	<div class="clear"></div>
	<div id="page"></div>
<script type="text/javascript">
//删除功能函数tm_deleteresourse()
function tm_deleteUser(obj){
	var opid = $(obj).data("opid");
	tm_dialoag({content:"您确定删除该VIP学员吗？",callback:function(ok){
		if(ok){
			$.ajax({
				type:"post",
				url:"/marlon/service/delete.jsp",
				data:{"id":opid},
				success:function(data){
					var jsonData = data.trim();
					if(jsonData=="success"){
						$(obj).parents(".tz_user_lists").fadeOut("slow",function(){
							$(this).remove;
						});
					}else{
						tm_dialoag({title:"警告",width:340,height:204,content:"非常抱歉，删除操作失败！"});							
					}
				}
			});
		}
	}});
}
/*更新VIP学员信息函数*/
function tm_updateUser(obj){
	var opid = $(obj).data("opid");
	tm_dialoag({content:"您确定要对ID:【"+opid+"】的VIP学员进行更新操作吗？",callback:function(ok){
		if(ok){
			window.location.href = "/marlon/service/update.jsp?id="+opid;
		}
	}});
}
/*分页实现*/
 $(function(){
	//调用分页
	tm_load_users(0,12,function(itemcount){
			tm_init_page(itemcount);
		   } 
	);
});
 $("#page").pagination(58, {
		num_display_entries : 3, //主体页数
		num_edge_entries : 2,//边缘页数
		current_page : 0,//指明选中页码
		items_per_page : 12, //每页显示多条条
		prev_text : "第一页",
		next_text : "下一页",
		showGo:true,//控制是否显示go 页 ,默认是true
		showSelect:true,//控制是否现在下拉框 默认是true
		callback : function(current_page, items_per_page) {//会回传两个参数一个当前页，显示的页数
			tm_load_users(current_page,items_per_page);
		}
	});
 /* 分页功能ajax实现 */
 function tm_load_users(pageNo,pageSize){
	$.ajax({
		type:"post",
		url:"/marlon/service/search.jsp",
		beforeSend:function(){$(".tz_user_lists").html("<div style='text-align:center;'><img src='/marlon/images/loading.gif'/></div>");},
		data:{"pageNo":(pageNo*12),"pageSize":pageSize},
		success:function(data){
			var jdata = data.trim();
		    var	jsonData = eval("("+jdata+")");
		    //改进写法
		    var length =jsonData.length;
		    var html = "";
		    for(var i=0;i<length;i++){
		    	/*
		    	根据type的值将对应的班级类型赋予type字段
		    	if(jsonData[i].type==1){
		    		jsonData[i].type="java基础班（type="+jsonData[i].type+"）";
		    	}else if(jsonData[i].type==2){
		    		jsonData[i].type="java中级班（type="+jsonData[i].type+"）";
		    	}else if(jsonData[i].type==3){
		    		jsonData[i].type="java高级班（type="+jsonData[i].type+"）";
		    	}else if(jsonData[i].type==4){
		    		jsonData[i].type="java系统学习班（type="+jsonData[i].type+"）";
		    	}else{
		    		jsonData[i].type="java就业特训班（type="+jsonData[i].type+"）";
		    	}
		    	*/
		    	if(jsonData[i].type==1){
		    		jsonData[i].type="java基础班";
		    	}else if(jsonData[i].type==2){
		    		jsonData[i].type="java中级班";	
		    	}else if(jsonData[i].type==3){
		    		jsonData[i].type="java高级班";
		    	}else if(jsonData[i].type==4){
		    		jsonData[i].type="java系统学习班";	
		    	}else{
		    		jsonData[i].type="java就业特训班";	
		    	}
		    	/*根据pay的值将对应的支付方式赋予pay字段*/
		    	if(jsonData[i].pay==1){
		    		jsonData[i].pay="支付宝";
		    	}else if(jsonData[i].pay==2){
		    		jsonData[i].pay="网上银行";	
		    	}
		    	/* (new Date()).format("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18 */
		    	 html += "<ul class='tz_user_lists'>"+
				"<li class='tz_u-id'>"+jsonData[i].id+"</li>"+
				"<li class='tz_u-account'>"+jsonData[i].account+"</li>"+
				"<li class='tz_u-type'>"+jsonData[i].type+"</li>"+
				"<li class='tz_u-pay'>"+jsonData[i].pay+"</li>"+
				"<li class='tz_u-contact'>"+jsonData[i].contact+"</li>"+
				"<li class='tz_u-jointime'>"+(new Date(/* jsonData[i].jointime */)).format("yyyy-MM-dd HH:mm:ss")+"</li>"+
				"<li class='tz_u-option'>"+
				"	<a href='regest.jsp' onclick='tm_addUser(this);'>"+"添加"+"</a>"+
				"	<a href='javascript:void(0)' data-opid='"+jsonData[i].id+"' onclick='tm_updateUser(this);'>"+"修改"+"</a>"+
				"	<a href='javascript:void(0)' data-opid='"+jsonData[i].id+"' onclick='tm_deleteUser(this);'>"+"删除"+"</a>"+
				"</li>"+
			    "</ul>"; 
		    }
		    $(".tz_user_lists").html(html);
		}
	});
} 
</script>
</body>
</html>