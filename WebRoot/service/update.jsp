<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.marlon.dao.UserDao"%>
<%@page import="com.marlon.bean.User"%>
<%
	String id = request.getParameter("id");
	User user = UserDao.findUpdateUser(new Integer(id));
	request.setAttribute("user", user);	
	request.getRequestDispatcher("../admin/updateUser.jsp").forward(request, response);
%>