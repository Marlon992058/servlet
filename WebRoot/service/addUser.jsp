<%@page import="com.marlon.util.StringUtils"%>
<%@page import="com.marlon.dao.UserDao"%>
<%@page import="com.marlon.bean.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	/* password = StringUtils.saltPassword("marlon", password); */
	if(StringUtils.isNotEmpty(username)&&StringUtils.isNotEmpty(password)){
		/* password = StringUtils.saltPassword("marlon", password);  */
		String idcard = request.getParameter("idcard");
		String type = request.getParameter("type");
		String pay = request.getParameter("pay");
		String contact = request.getParameter("contact");
		User user = new User();
		user.setAccount(username);
		user.setPassword(password);
		user.setIdcard(idcard);
		user.setType(new Integer(type));
		user.setPay(new Integer(pay));
		user.setContact(contact);
		user.setStatus(1);
		boolean flag = UserDao.saveUser(user);
		if(flag){
			out.print("success");
		}else{
			out.print("fail");	
		}
	}else{
		out.print("fail");
	}
%>