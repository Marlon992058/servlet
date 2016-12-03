<%@ page language="java" import="java.util.*,com.marlon.bean.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tz.tld" prefix="tz"%>
<!DOCTYPE html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<link href="/marlon/css/book.css" rel="stylesheet" type="text/css" /></link>
	<link rel="stylesheet" type="text/css" href="/marlon/css/css.css"></link>
	<link rel="stylesheet" type="text/css" href="/marlon/css/logs.css"></link>
	<link type="text/css" rel="stylesheet" href="/marlon/js/editer/themes/default/css/umeditor.css"></link>
	<script type="text/javascript" src="/marlon/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="/marlon/js/util.js"></script>
	<script type="text/javascript" src="/marlon/js/tmdrag.js"></script>
	<script type="text/javascript" src="/marlon/js/tmDialog.js"></script>
	<script type="text/javascript" charset="utf-8" src="/marlon/js/editer/umeditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="/marlon/js/editer/umeditor.min.js"></script>
</head>

<body onload="initLogs();">
<div class="logsTitle"><label id="change_color" style="border:1px solid gray;border-radius:15px;padding:8px 15px;">VIP学员和管理员互动</label></div>
<div class="main_logs">
	<textarea id="myEditor" class="input text_area" style="width:697px;height:240px;text-indent:2em;margin-top:10px;" autofocus="autofocus" maxlength="140"  placeholder="请输入评论信息长度不能超过140位!"></textarea>
	<div><input style="" type="button" data-userid="${user.id}" id="tm_commentLogs" class="comment" value="提交"></div>
</div>
<div class="postwrapper box wid700" id="contentbox">
	
</div>
<script type="text/javascript">
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
			/* content = getEditoHtml("myEditor"); */
			timer = setTimeout(function(){
				$.ajax({
					type:"post",
					url:"/marlon/service/commentLog.jsp",
					data:{"content":content,"logId":logId},
					success:function(data){
						var jdata = data.trim();
						if(jdata=="success"){
							alert("回复成功！");
						}else{
							alert("操作失败，请重新回复操作！");
						}
					}
				});
			});
		});
	}
	function initLogs(){
		var um = UM.getEditor("myEditor");
		$.ajax({
			type:"post",
			url:"/marlon/service/searchUserLogs.jsp",
			success:function(data){
				 $("#contentbox").html(data);
			}
		});
	};
</script>
</body>
</html>