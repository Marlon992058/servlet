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
	<textarea id="myEditor" class="input text_area" style="width:697px;height:240px;text-indent:2em;margin-top:10px;" maxlength="140"  placeholder="请输入评论信息长度不能超过140位!"></textarea>
	<div><input style="" type="button" data-userid="${user.id}" id="tm_commentLogs" class="comment" value="提交"></div>
</div>
<div class="postwrapper box wid700" id="contentbox">
	
</div>
<script type="text/javascript">
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
	function tm_comment(){
		alert(aaaa);
	}
</script>
</body>
</html>