<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.marlon.dao.UserDao,com.marlon.bean.User"%>
<%@page import="com.marlon.util.StringUtils"%>
<%@page import="org.apache.struts2.json.JSONUtil"%>
<%
	String name = request.getParameter("name");
	String idCard = request.getParameter("idcard");
	String password = request.getParameter("password");
	String type = request.getParameter("type");
	String pay = request.getParameter("pay");
	String contact = request.getParameter("contact");
	User user = new User();
	user.setAccount(name);
	user.setIdcard(idCard);
	user.setPassword(password);
	user.setType(type==null?null:new Integer(type));
	user.setStatus(1);
	user.setPay(pay==null?null:new Integer(pay));
	user.setContact(contact);
	boolean flag = UserDao.saveUser(user);
	if(flag){
		out.print(JSONUtil.serialize(user));
	}else{
		out.print("fail");
	}
%>