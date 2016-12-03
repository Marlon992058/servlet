<%@page import="com.marlon.util.StringUtils"%>
<%@page import="com.marlon.bean.User"%>
<%@page import="com.marlon.dao.UserDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String account = request.getParameter("account");
	String idcard = request.getParameter("idcard");
	String type = request.getParameter("type");
	String pay = request.getParameter("pay");
	String contact = request.getParameter("contact");
	boolean flag = UserDao.modifyUser(account, idcard, new Integer(type), new Integer(pay), contact, new Integer(id));
	if(flag){
		out.print("success");
	}else{
		out.print("fail");
	}
%>