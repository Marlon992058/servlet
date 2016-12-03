<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="css/regist.css" />
	<link rel="stylesheet" type="text/css" href="css/layout.css" />
	<script type="text/javascript" src="js/jsRegister/jquery-1.8.3-min.js"></script>
	<script type="text/javascript" src="js/jsRegister/jquery.validate.js"></script>
	<script type="text/javascript" src="js/jsRegister/jquery.metadata.js"></script>
	<script type="text/javascript" src="js/jsRegister/resgin.js"></script>
	<script type="text/javascript" src="js/tmDialog.js"></script>
	<script type="text/javascript" src="js/tmdrag.js"></script>
	<title>尚学堂VIP学员注册——Marlon</title>
	</head>
<body>
<div class="wrapper">
	<div class="title">新用户注册</div>
    <form id="signupForm" method="post" action="" class="zcform">
		<p class="clearfix">
        	<span class="one" for="username">用户名：</span>
            <input id="username" name="username" autofocus="autofocus" class="{required:true,rangelength:[6,20],}" type="text" value placeholder="请输用户名" />
        </p>
        <p class="clearfix">
        	<span class="one" for="idcard">身份证号：</span>
        	<input id="idcard" name="idcard" class="{required:true,rangelength:[18,18],}" value placeholder="请输入您的身份证号" />
        </p>
        <p class="clearfix">
         	<span class="one"  for="password">登录密码：</span>
        	<input id="password" name="password" type="password" class="{required:true,rangelength:[8,20],}" value placeholder="请输入密码" />
        </p>
        <p class="clearfix">
        	<span class="one" for="confirm_password">确认密码：</span>
        	<input id="confirm_password" name="confirm_password" type="password" class="{required:true,equalTo:'#password'}" value placeholder="请再次输入密码" />
        </p>
		<p class="clearfix">
			<span class="one" for="type">班级类型：</span>
			<select class="type" name="type">
				<option value="0" selected="selected">----请选择班级----</option>
				<option value="1">java基础班</option>
				<option value="2">java中级班</option>
				<option value="3">java高级班</option>
				<option value="4">java系统学习班</option>
				<option value="5">java就业特训班</option>
			</select>
		</p>		
		<p class="clearfix">
			<span class="one" for="pay">支付方式：</span>
			<select class="pay" name="pay">
				<option value="0" selected="selected">----请选择支付方式----</option>
				<option value="1">支付宝</option>
				<option value="2">网上银行</option>
			</select>
		</p>
        <p class="clearfix">
        	<span class="one" for="telphone">联系电话：</span>
        	<input id="telphone" name="telphone" type="text" class="required" value placeholder="请输入你的手机号" />
        </p>
        <p class="clearfix agreement">
        	<label class="degree"><input type="checkbox" /><b class="left">已阅读并同意 </b></label><b class="left"><a href="javascript:void(0)">《用户协议》</a></b>
        </p>
       	<p class="clearfix"><input class="submit" type="button" onclick="tz_addUsers();" value="立即注册"/><a class="login" href="login.jsp">立即登录&gt;</a></p>
    </form>
</div>
<!--content end-->
<script type="text/javascript">
	function tz_addUsers(){
		var username = $("#username").val();
		var password = $("#password").val();
		var pwd = $("#confirm_password").val();
		var idcard = $("#idcard").val();
		var type = $("select.type option:selected").val();
		var pay =  $("select.pay option:selected").val();
		var contact = $("#telphone").val();
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
			url:"service/addUser.jsp",
			data:params,
			success:function(data){
				var jdata = data.trim();
				if(jdata=="success"){
					tm_dialoag({title:"提示",width:380,height:204,content:"恭喜，您添加VIP成功！"});
					window.location.href = "login.jsp";
				}else{
					tm_dialoag({title:"提示",width:380,height:204,content:"抱歉，注册失败！"});
					request.getRequestDispatcher("register.jsp").forward(request, response);
				}
			}
		});
	}
	//显示错误信息
	function tm_showmessage(message){
		$("#message").show().html(message).stop(true,true).fadeOut(3000);
	}
</script>
<body>
</body>
</html>