<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.marlon.bean.User"%>
<%@page import="com.marlon.dao.UserDao"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tz.tld" prefix="tz"%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>学员信息</title>
		<meta name="Keywords" content="关键词,关键词">
		<meta name="description" content="">
		<link href="/marlon/css/updateUser.css" rel="stylesheet" type="text/css" />
		<link href="/marlon/css/layout.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="/marlon/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="/marlon/js/util.js"></script>
		<script type="text/javascript" src="/marlon/js/tmdrag.js"></script>
		<script type="text/javascript" src="/marlon/js/tmDialog.js"></script>
	</head>
<body onselectstart="return false">
	<div class="tz_table">
		<form method="post">
			<ul class="tz_u-id">
				<li>操作的管理员</li><li>被操作VIP的ID</li>
				<li>姓名</li>
				<li>身份证号</li>
				<li>密码</li>
				<li>班级类型</li>
				<li>支付方式</li>
				<li>联系方式</li>
				<li><input class="tz_btn" type="button" onclick="tm_updateUser(this)" data-opid="${user.id}" value="提交"/></li>
			</ul>
			<ul class="tz_u-account">
				<li class="tz_op-center">管理员</li><li class="tz_op-center">${user.id }</li>
				<li><input type="text" id="account" autofocus="autofocus" name="account" value="${user.account }"/></li>
				<li><input type="text" id="idcard" name="idcard" value="${user.idcard }"/></li>
				<li style="text-indent:15px;">${user.password}</li>
				<li><input type="text" id="type" name="type" value="${user.type }"/></li>
				<li><input type="text" id="pay" name="pay" value="${user.pay }"/></li>
				<li><input type="text" id="contact" name="contact" value="${user.contact }"/></li>
				<li><input class="tz_btn" type="reset" value="重置"/></li>
			</ul>
		</form>
	</div>
<script type="text/javascript">
function tm_updateUser(obj){
	var opid = $(obj).data("opid");
	var account = $("#account").val();
	var idcard = $("#idcard").val();
	var type = $("#type").val();
	var pay = $("#pay").val();
	var contact = $("#contact").val();
	var params = {
			"id":opid,
			"account":account,
			"idcard":idcard,
			"type":type,
			"pay":pay,
			"contact":contact
	};
	$.ajax({
		type:"post",
		url:"/marlon/service/modifyUser.jsp",
		data:params,
		success:function(data){
			var jdata = data.trim();
			if(jdata=="success"){
				/* tm_dialoag({title:"提示",width:380,height:204,content:"恭喜，您对VIP学员ID：【"+opid+"】更新成功！"}); */
				tm_dialoag({content:"恭喜，您对VIP学员ID：【"+opid+"】更新成功！",callback:function(ok){
					if(ok){
						window.location.href = "userInfo.jsp"; 
					}
				}});
			}else{
				tm_dialoag({title:"提示",width:380,height:204,content:"您对VIP学员ID：【"+opid+"】更新失败，是否重新操作！"});
			}
		}
	});
}
</script>
</body>
</html> 