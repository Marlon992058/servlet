<%@ page language="java" import="java.util.*,com.marlon.bean.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tz.tld" prefix="tz"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>后台管理</title>
	<link href="/marlon/css/book.css" rel="stylesheet" type="text/css" /></link>
	<link rel="stylesheet" type="text/css" href="/marlon/css/css.css"></link>
	<link rel="stylesheet" type="text/css" href="/marlon/css/logs.css"></link>
	<link href="/marlon/css/layout.css" rel="stylesheet" type="text/css" />
	<link type="text/css" rel="stylesheet" href="/marlon/js/editer/themes/default/css/umeditor.css"></link>
	<script type="text/javascript" src="/marlon/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="/marlon/js/util.js"></script>
	<script type="text/javascript" src="/marlon/js/tmdrag.js"></script>
	<script type="text/javascript" src="/marlon/js/tmDialog.js"></script>
	<script type="text/javascript" charset="utf-8" src="/marlon/js/editer/umeditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="/marlon/js/editer/umeditor.min.js"></script>
</head>
<body>
<%
	Admin admin = (Admin)session.getAttribute("admin");
%>
<div class="logsTitle"><label id="change_color" style="border:1px solid gray;border-radius:15px;padding:8px 15px;">VIP学员和管理员互动</label></div>
<div class="main_logs">
	<textarea id="myEditor" class="input text_area" style="width:697px;height:240px;text-indent:2em;margin-top:10px;" autofocus="autofocus" maxlength="140"  placeholder="请输入评论信息长度不能超过140位!"></textarea>
	<div><input style="" type="button" data-userid="${user.id}" id="tm_commentLogs" class="comment" value="提交"></div>
</div>
<div class="postwrapper box wid700" id="contentbox"></div>
<script type="text/javascript">
	$(function(){
		initLogs();//相当于给body加 onload="initLogs();"
	});
	//删除功能函数tm_deleteresourse()
	function tm_deleteLog(obj){
		var logid = $(obj).data("logid");
		$.ajax({
			type:"post",
			url:"/marlon/service/deleteLog.jsp",
			data:{"logid":logid},
			success:function(data){
				var jsonData = data.trim();
				if(jsonData=="success"){
					$(obj).parents(".photo").fadeOut("slow",function(){
						$(this).remove;
					});
				}else{
					alert("删除失败！");
				}
			}
		});
	}
	/* 加载留言信息 */
	function initLogs(){
		$.ajax({
			type:"post",
			url:"/marlon/service/searchUserLogs.jsp",
			success:function(data){
				var jdata = data.trim();
			    var	jsonData = eval("("+jdata+")");
			    //改进写法
			    var length =jsonData.length;
			    var html = "";
			    for(var i=0;i<length;i++){
			    	html += "<div class='block photo'>"+
							"<label style='font-weight: 700;font-size: 18px;'>第"+jsonData[i].id+"楼</label>"+
						    "       <div class='side'>"+
					        "               <div class='day'><a href='javascript:void(0);'>"+(new Date(jsonData[i].createtime )).format("MM")+"</a></div>"+
					        "               <div class='month'><a href='javascript:void(0);'>"+(new Date(jsonData[i].createtime )).format("dd")+"</a></div>"+
					        "       </div>"+
					        "       <div class='main'>"+
					        "           <div class='content'>"+jsonData[i].content+"</div>"+
							"		    <div class='link'>"+
							"			  <a id='comment' href='javascript:void(0);' data-logid='"+jsonData[i].id+"' onclick='tm_comment(this);'>回复</a>"+
							"			  <a href='javascript:viod(0);' data-logid='"+jsonData[i].id+"' onclick='tm_deleteLog(this)'>删除</a>"+
							"		    </div>"+
							"		    <div class='bcmtmore s-bd2' style='display: none;'>"+
							"			   <div class='bcmtlsta'>"+
							"				  <a href='javascript:void(0)' class='s-fc2 ztag'>查看更多</a>"+
							"		       </div>"+
							"	        </div>"+
							"           <div class='comment'></div>"+
							"	    </div>"+
							"</div>";
			    }
			    $("#contentbox").html(html);
			}
		});
	};
	/* 回复留言 */
	function tm_comment(){
		var um = UM.getEditor("myEditor");//初始化富文本编辑器
		$(".main_logs").show();
		var timer = null;
		$("#tm_commentLogs").click(function(){
			var content = um.getContentTxt();//获取富文本编辑器的纯文本内容（作用：判断是否为空），getContent()获取文本内容（作用：放值）
			var logId = $("#comment").data("logid");
			if(isEmpty(content)){
				alert("回复内容不能为空！");/* tm_showmessage("请输入内容！"); */
				UM.getEditor("myEditor").focus();
				return;
			}
			content = um.getContent();
			clearTimeout(timer);
			timer = setTimeout(function(){
				$.ajax({
					type:"post",
					url:"/marlon/service/commentLog.jsp",
					data:{"content":content,"logId":logId},
					success:function(data){
						var jdata = data.trim();//var jdata = eval("("+data.trim()+")");
						var	jsonData = eval("("+jdata+")");
					    //改进写法
				    	$(".comment").prepend("<div class='disc_list'>"+
	                    "    <div class='pic'><a href='#'><img src='/marlon/images/pic.jpg' width='43' height='43'/></a></div>"+
	                    "    <div class='liuyan'>"+
	                    "         <dl>"+
	                    "             <dt>marlon</dt>"+
	                    "             <dd>"+jsonData.content+"</dd>"+                                   
	                    "         </dl>"+
	                    "         <div class='pubdata'>"+
	                    "              <span>发表于："+jsonData.createtime+" |</span>"+
	                    "              <a href='#' class='fl'>只看该作者</a>"+
	                    "              <a href='#' class='fr'><span class='nolike teac_icon'></span><p>不喜欢(21)</p></a>"+
	                    "              <a href='#' class='fr'><span class='onlike teac_icon'></span><p>喜欢(123)</p></a>"+
	                    "         </div>"+
	                    "    </div>"+
	                    "    <div class='clearfix'></div>"+
	                   	"	</div>");
					   /*  $(".main_logs").hidden(); */
					}
				});
			});
		});
	}
</script>
</body>
</html>