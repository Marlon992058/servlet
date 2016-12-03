<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
	<head>
	<!--声明当前页面的编码集:charset=gbk,gb2312(中文编码)，utf-8国际编码-->
	<meta http-equiv="Content-Type"content="text/html;charset=utf-8">
	<!--当前页面的三要素-->
	<title>登录页面</title>
	<meta name="keywords" content="关键词，关键词">
	<meta name="discription" content="">
	<!--css,js-->
	<link rel="stylesheet" type="text/css" href="css/login.css"></link>
	</head>
<body>
 <div id="screen">
 	<div style="height:140px;"></div>
	<div id="change">
		<ul class="bt">
			<li class="hover">VIP学员登录</li>
			<li>高级管理员登录</li>
		</ul>
		<div class="show cjly">
			<ul>
				<li>
					<div class="main">
						<ul>
							<li>
								<div class="messagebox"><span class="message"></span></div>
								<form id="form1" method="post">
									<span>用户名：<input type="text" autofocus="autofocus" placeholder="邮箱/用户名" id="username" name="username" value=""/></span>
									<span>密&nbsp;码：<input type="password" placeholder="密码" id="password" name="password" /></span>
									<span><input class="but" type="button" onclick="tz_user_login(this)" value="登 录"/><label><input type="checkbox" id="cookie" name="cookieMark" value="1">七天免登录</label><a href="register.jsp">注册</a></span>
								</form>
							</li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<div class="show aqbwz">
			<ul>
				<li>
					<div class="main gl">
						<ul>
							<li>
								<div class="messagebox"><span class="message"></span></div>
								<form id="form2" method="post">
									<span>用户名：<input type="text" autofucus="autofocus" placeholder="邮箱/用户名" id="username" name="username" value=""/></span>
									<span>密&nbsp;码：<input type="password" placeholder="密码" id="password" name="password" /></span>
									<span><input class="but" type="button" onclick="tz_admin_login(this)" value="登 录"/>
								</form>
							</li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>
<!------引入外部jquery类库--------->
<script type="text/javascript" src="js/jquery.js"></script><!--这里将src错写成scr-->
<script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript">
	//按下Enter键提交表单
	$(document).keydown(function(e){
		if(e.keyCode==13){
			tz_user_admin();
			tz_user_login();
		}
	});
	var _index =0;
	 $("#change").find("li").click(function(){
	    $(this).addClass("hover").siblings().removeClass("hover");
		_index= $("#change ul.bt li.hover").index();
		//$(".message").html(message).stop();
		$(".show").hide().eq(_index).show();  //这里的show前面丢掉了.
		//$(".show").hide().eq($(this).index()).show();
	 });
	 //管理员登录
	 function tz_admin_login(){
		 var form = "form2";
		 var url = "service/admin.jsp";
		 var success = "admin/index.jsp";
		 tz_login(form,url,success);
	 }
	 //学员登录
	 function tz_user_login(){
		 var form = "form1";
		 var url = "service/user.jsp";
		 var success = "stage/index.jsp";
		 tz_login(form,url,success);
	 }
	 //登录ajax通用实现
	 function tz_login(form,URL,SUCCESS){
		 var $name = $("#"+form+" #username");
		 var $pwd = $("#"+form+" #password");
		 var cookieMark = $("#cookie:checked").val();
		 var username = $name.val();
		 var password = $pwd.val();
		 if(isEmpty(username)){
			    $name.focus();
				tm_showmessage("请输入账号");
				return;
		 }
		 if(isEmpty(password)){
			 $pwd.focus();
			 tm_showmessage("请输入用户密码");
		     return;
		 }
		 $.ajax({
			 type:"post",
			 url:URL,
			 data:{"username":username,"password":password,"cookieMark":cookieMark},
			 success:function(data){
				 var jdata = data.trim();
				 if(jdata=="success"){
					 window.location.href = SUCCESS;
				 }else{
					 $name.select();
					 $pwd.val("");
					 tm_showmessage("您输入账号和密码错误");
				 }
			 }
		 });
	 }
	//显示错误信息
	function tm_showmessage(message){
		$(".message").show().html(message).stop(true,true).fadeOut(3000);
	}
</script>
</body>
</html>
