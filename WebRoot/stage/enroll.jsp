<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
 <head>
		<!--声明当前页面的编码集：charset=gbk,gb2312(中文编码)，utf-8国际编码-->
		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
		<!--当前页面的三要素-->
		<title>北京尚学堂</title>
		<meta name="Keywords" content="关键词,关键词">
		<meta name="description" content="">
		<!--css,js-->
		<style type="text/css">
			@import url("../css/css.css");
			@import url("../css/enroll.css");
		</style>
</head>
<body style="background:#E8E4E4;">
<!--top start-->
<%@include file="../common/head.jsp" %>
<!--top start-->
<!--content start-->
<div id="content">
	<div><img src="../images/bm_lc.gif"></div>
	<div><img src="../images/bm.JPG"></div>
	<div class="cont">
		<p>
			<b>1、参加培训的学员按照下面的汇款方式缴纳500元报名预订金，该报名费在开课后，15天内退还给学生，只是订座而已。</b><br/>
			<b>2、将您的个人信息以及汇款情况发送到bjsxt2005@qq.com。</b><br/>
			&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;（1）个人信息：主要包括报名班级、您的姓名、性别、专业、毕业院校、学历、电话、现住城市等　<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （2）汇款情况：主要包括汇出银行、汇入银行、汇款金额、汇款时间、汇款种类（报名费，培训费）、汇款人等。<br/>
			<b>3、在收到您的报名费用后，我们将给您发送报名成功确认信以及预习内容，请注意查收您的邮件。</b><br/>
			<b>4、在正式开课前，您需要准备：</b><br/>
			&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 身份证及学历证的原件，并提供复印件一份;本人一寸彩色照。<br/>
			<b>5、您可以在开课前按照如下两种方式报名订座。</b><br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（1）现金缴纳：您可以到我们的培训中心所在地亲自缴纳。<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （2）银行汇款：您可以通过银行汇款的方式缴纳您的报名费，参见下面的汇款帐号。<br/>
			<b>6、开课。开课当天要求学员必须到</b><br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（1）确定机位后　<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（2）调试自己的机器<br/>
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（3）领取课程资料<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（4）签订培训协议<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（5）老师安排课程<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（6）次日正式上课<br/><br/>
			<b>银行汇款</b><br/>
			<span>工商银行：6212 2602 0001 6271 948 　　高昱</span><br/>
			<span>农业银行：6228 4800 1100 7537 514 　　高昱</span>
		</p>
	</div>
</div>
<!--content end-->
<!--bottom start-->
<%@include file="../common/bottom.jsp" %>
<!--bottom end-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
$(".nav ul li a").click(function(){
	$(this).addClass("hover").siblings().removeClass("hover");
});
</script>
</body>
</html>