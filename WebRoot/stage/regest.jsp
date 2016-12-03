<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<!--声明当前页面的编码集：charset=gbk,gb2312(中文编码)，utf-8国际编码-->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<!--当前页面的三要素-->
		<title>北京尚学堂</title>
		<meta name="Keywords" content="关键词,关键词">
		<meta name="description" content="">
		<!--css,js-->
		<style type="text/css">
			*{margin:0;padding:0;}
			body{font-size:12px;font-family:微软雅黑;}
			img{border:0px;}
			/*--------top start-------*/
			.top{width:100%;height:150px;background:url("/marlon/images/t_bg.JPG");}
			.top .head{width:1000px;height:105px;margin:0px auto;}
			.top .head .logo{float:left;}
			.top .head .right{float:right;}
			.clear{clear:both;}
			.top .nav{width:1000px;height:40px;margin:0px auto;}
			.top .nav ul li{list-style:none;float:left;margin-top:0px;}
			.top .nav ul li a{text-decoration:none;display:block;padding:0px 40px;
						font-size:14px;color:#fff;line-height:40px;}
			/*.top .nav ul li a.hover{background-color:#000033;}
			.top .nav ul li a:hover{background-color:#000033;}*/
			/*--------content start-------*/
			.screen{height:663px;background:url("/marlon/images/bg.jpg") no-repeat center;}
			.screen .title{width:420px;height:120px;margin:0px auto;}
			.screen .title h1{font-family:华文新魏;text-align:center;}
			.screen .main{width:360px;height:400px;border:1px solid #b09a83;margin:0px auto;}
			.screen .main ul li{width:300px;height:400px;list-style-type:none;box-shadow:0px 0px 30px #000; background:#86664d;border-radius:15px;padding-left:60px;}
			.screen #main ul li form .message{width:360px;height:40px;border:1px solid red;}
			.screen #main ul li form table{width:360px;height:380px;text-align:center;font-size:16px;font-family:华文新魏;}
			.screen .main ul li form table tr{height:40px;}
			.screen .main ul li form table tr td input{border-radius:8px;}
			.screen .main ul li form table tr td input.txt{width:150px;height:30px;}
			.screen .main ul li form table tr td input.tj{width:100px;height:30px;font-size:20px;font-family:华文新魏;border-radius:8px;margin-right:-30px;}
			select{width:150px;height:30px;font-size:18px;font-family:华文新魏;}
			/*--------bottom start-------*/
			.bottom{width:100%;height:140px;background:#ececec;}
			.bottom .btm{width:1000px;height:140px;background:url("/marlon/images/bottom.jpg");margin:0px auto;}
			.bottom .btm .up{width:1000px;height:58px;border:1px solid #ececec;}
			.bottom .btm .up p{margin:20px 280px;}
			.bottom .btm .up p a{text-decoration:none; font-size:14px;color:#000; font-size:14px;}
			.bottom .btm .down{width:1000px;height:81px;}
			.bottom .btm .down p{margin:2px;text-align:center;}
		</style>
</head>
<!--top start-->
<!--top start-->
<div class="top">
	<div class="head">
		<div class="logo">
			<a href="javascript:void(0)"><img style="opacity: 1;" src="/marlon/images/logo.jpg" width="252" height="105" alt="尚学堂"></a>
		</div>
		<div class="right">
				<a href="#"><img style="opacity: 1;" src="/marlon/images/by.jpg" width="672" height="105" alt=""></a>
		</div>	
	</div>
	<div class="clear"></div>
	<div class="nav">
		<ul>
			<li><a class="hover" href="index.jsp">首页</a></li>
			<li><a href="java.jsp">java培训</a></li>
			<li><a href="vip.jsp">VIP专场</a></li>
			<li><a href="enroll.jsp">报名流程</a></li>
			<li><a href="course.jsp">在线课堂</a></li>
			<li><a href="about.jsp">关于我们</a></li>
		</ul>
	</div>
</div>
<!--content start-->
<div class="screen">
	<div class="title"><br/><br/><br/><br/><br/><h1>学员报名注册</h1></div>
	<div class="main">
		<ul>
			<li>
				<form id="addUser" method="post">
					<div class="message"></div>
					<table align="center" border="0" bordercolor="#FFFF99">
							<tr>
								<td>用&nbsp;&nbsp;户&nbsp;&nbsp;名：<input class="txt" name="username" id="username" type="text" placeholder="用户名/邮箱"/></td>
							</tr>
							<tr>
								<td>身份证号：<input class="txt" name="idcard" id="idcard" type="text" placeholder="身份证号"/></td>
							</tr>
							<tr>
								<td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input class="txt" name="password" id="password" type="password" placeholder="密码"/></td>
							</tr>
							<tr>
								<td>确认密码：<input class="txt" type="password" id="pwd" name="pwd" placeholder="确认密码"/></td>
							</tr>
							<tr>
								<td>班级类型：
								<!--<input type="radio" value="js"  name="select" />管理员<input type="radio" value="js" name="select" />高级管理员<input type="radio" value="js"  name="select"/>会员-->
								<select name="type">
									<option value="0" selected="selected">----请选择----</option>
									<option value="1">java基础班</option>
									<option value="2">java中级班</option>
									<option value="3">java高级班</option>
									<option value="4">java系统学习班</option>
									<option value="5">java就业特训班</option>
								</select>
							    </td>
							</tr>
							<tr>
								<td>支付方式：<label><input type="radio" value="1" id="pay"  name="pay" />支付宝</label>
										     <label><input type="radio" value="2" id="pay" name="pay" />网上银行</td></label>
							</tr>
							<tr>
								<td>联系方式：<input class="txt" name="contact" id="contact" type="text" placeholder="电话号码"/></td>
							</tr>
							<tr>
								<td align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="tj" name="submit" onclick="tz_addUsers();" type="button" value="提交" border="0"/></td>
							</tr>
					 </table>
				</form>
			</li>
		</ul>
	</div>
</div>
<!--content end-->
<!--bottom start-->
<%@include file="/common/bottom.jsp" %>
<!--bottom end-->
<script type="text/javascript" src="/marlon/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	function tz_addUsers(){
		var username = $("#username").val();
		var password = $("#password").val();
		var pwd = $("#pwd").val();
		var idcard = $("#idcard").val();
		var type = $("select option:selected").val();
		var pay = $("#pay:checked").val();
		var contact = $("#contact").val();
		var params = {
				"username":username,
				"password":password,
				"pwd":pwd,
				"idcard":idcard,
				"type":type,
				"pay":pay,
				"contact":contact
		}; 
		//var params = $("#addUser").serialize();
		$.ajax({
			type:"post",
			url:"/marlon/service/addUser.jsp",
			data:params,
			success:function(data){
				var jdata = data.trim();
				if(jdata=="success"){
					window.location.href = "/marlon/login.jsp";
				}else{
					request.getRequestDispatcher("regest.jsp").forward(request, response);
				}
			}
		});
	}
</script>
<body>
</body>
</html>
