<%@page import="com.marlon.util.StringUtils"%>
<%@page import="com.marlon.dao.UserDao,com.marlon.bean.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	//业务：根据Id删除用户信息，利用ajax
	String id = request.getParameter("id");
	if(StringUtils.isNotEmpty(id)){
		boolean flag = UserDao.deleteUser(new Integer(id));
		if(flag){
			out.print("success");
		}else{
			out.print("fail");
		}
	}else{
		out.print("fail");
	}
%>