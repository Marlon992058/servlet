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
			@import url("/marlon/css/css.css");
			@import url("/marlon/css/course.css");
		</style>
</head>
<body style="background:#E8E4E4;">
<!--top start-->
<%@include file="/common/head.jsp" %>
<!--top start-->
<!--content start-->
<div id="content">
	<div class="cour">
		<h2>最新课程推荐</h2>
		<span></span>
		<div class="main">
			<ul>
				<li><img src="/marlon/images/java.png"/>
				    <p>讲授java基础技能，同时将若干个项目穿插到整体教学中。达到让学生寓教于乐、深化学习的目的。</p>
					<a href="http://www.sxt.cn/course/showdetail-4-one.html"><img src="/marlon/images/into.gif"/></a>
				</li>
				<li><img src="/marlon/images/html.jpg"/>
				    <p>本课程讲授了HTML、CSS、javascript等工作中常用的网页开发技术。</p>
					<a href="http://www.sxt.cn/course/showdetail-5-one.html"><img src="/marlon/images/into.gif"/></a>
				</li>
				<li><img src="/marlon/images/oracle.jpg"/>
				    <p>讲授了oracle数据库、mysql数据库的用法。传授了SQL语言、数据库设计等重要的技术。传授JDBC技术。</p>
					<a href="http://www.sxt.cn/course/showdetail-6-one.html"><img src="/marlon/images/into.gif"/></a>
				</li>
				<li><img src="/marlon/images/linux.jpg"/>
				    <p>本课程讲授了linux系统的基本知识、常用操作命令、一般软件的安装过程、服务器软件的安装过程。</p>
					<a href="http://www.sxt.cn/course/showdetail-10-one.html"><img src="/marlon/images/into.gif"/></a>
				</li>
				<li><img src="/marlon/images/javaee.jpg"/>
				    <p>本课程讲授了javaee服务器端编程的技术。同时，也将ajax归入本课程中。</p>
					<a href="http://www.sxt.cn/course/showdetail-11-one.html"><img src="/marlon/images/into.gif"/></a>
				</li>
				<li><img src="/marlon/images/jsp.jpg"/>
				    <p>本项目课程是基于jsp和servlet项目。项目从一个字母开始、经老师手把手打造而成。</p>
					<a href="http://www.sxt.cn/course/showdetail-12-one.html"><img src="/marlon/images/into.gif"/></a>
				</li>
				</li><li><img src="/marlon/images/xml.jpg"/>
				    <p>XML语言是软件行业最重要的标记语言。几乎所有的编程领域都会用到,主要用到：数据表示和传输。</p>
					<a href="http://www.sxt.cn/course/showdetail-8-one.html"><img src="/marlon/images/into.gif"/></a>
				</li>
				<li><img src="/marlon/images/svn.jpg"/>
				    <p>本课程讲授了公司开发中常用的版本控制软件的用法。包含：CVS、SVN等软件的用法。</p>
					<a href="http://www.sxt.cn/course/showdetail-9-one.html"><img src="/marlon/images/into.gif"/></a>				
			</ul>
			<div class="clear"></div>
		</div>
	</div>
	<marquee direction="left">
		<div class="scroll">
			<ul>
				<li><img src="/marlon/images/java.png" width="320" height="240"/></li>
				<li><img src="/marlon/images/html.jpg" width="320" height="240"/></li>
				<li><img src="/marlon/images/oracle.jpg" width="320" height="240"/></li>
				<li><img src="/marlon/images/linux.jpg" width="320" height="240"/></li>
				<li><img src="/marlon/images/javaee.jpg" width="320" height="240"/></li>
				<li><img src="/marlon/images/jsp.jpg" width="320" height="240"/></li>
				<li><img src="/marlon/images/xml.jpg" width="320" height="240"/></li>
				<li><img src="/marlon/images/svn.jpg" width="320" height="240"/></li>
			</ul>
		</div>
	</marquee>
</div>
<!--content end-->
<!--bottom start-->
<%@include file="/common/bottom.jsp" %>
<!--bottom end-->
</body>
</html>
