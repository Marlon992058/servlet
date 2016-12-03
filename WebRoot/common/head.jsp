<%@ page language="java" import="java.util.*,com.marlon.bean.*" pageEncoding="UTF-8"%>
<%
	User user = (User)session.getAttribute("user");
%>
<div class="top">
	<div class="head">
		<div class="logo">
			<a href="/marlon/stage/index.jsp"><img style="opacity: 1;" src="/marlon/images/logo.jpg" width="252" height="105" alt="尚学堂"></a>
		</div>
		<div class="right">
			<a href="javascript:void(0)"><img style="opacity: 1;" src="/marlon/images/by.jpg" width="672" height="105" alt=""></a>
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
			<li><a href="book/book.jsp">留言板</a></li>
		</ul>
		<div class="user">当前登录学员：<b id="change_color">${user.account}</b><a style="font-size:14px;" href="../service/logout.jsp">【退出】</a></div>
	</div>
</div>