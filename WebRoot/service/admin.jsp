<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.marlon.dao.AdminDao,com.marlon.bean.Admin"%>
<%@page import="com.marlon.util.StringUtils"%>
<%@page import="org.apache.struts2.json.JSONUtil"%>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	Admin admin = AdminDao.isExistAdmin(username, password);
	if(StringUtils.isNotEmpty(username)&&StringUtils.isNotEmpty(password)){
		if(admin != null){
			out.print("success");
			session.setAttribute("admin", admin);
		}else{
			out.print("fail");
		}
	}else{
		out.print("fail");
	}
%>