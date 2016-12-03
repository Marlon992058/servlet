<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.marlon.dao.UserDao,com.marlon.bean.User"%>
<%@page import="com.marlon.util.StringUtils"%>
<%@page import="org.apache.struts2.json.JSONUtil"%>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
/* 	password = StringUtils.saltPassword("marlon", password);  */
	if(StringUtils.isNotEmpty(username)&&StringUtils.isNotEmpty(password)){
		User user = UserDao.isExistUser(username, password);
		if(user!=null){
			out.print("success");
			session.setAttribute("user", user);
		}else{
			out.print("fail");
		}
	}else{
		out.print("fail");
	}
%>