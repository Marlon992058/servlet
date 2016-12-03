<%@page import="com.marlon.util.StringUtils"%>
<%@page import="com.marlon.dao.UserDao"%>
<%@page import="com.marlon.bean.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	session.invalidate();
	response.sendRedirect("../login.jsp");
%>