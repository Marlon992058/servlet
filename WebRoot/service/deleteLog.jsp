<%@page import="com.marlon.dao.log.CommentLogs"%>
<%@page import="com.marlon.util.StringUtils"%>
<%@page import="com.marlon.dao.UserDao,com.marlon.bean.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	//业务：根据logId删除留言信息
	String logId = request.getParameter("logid");
	if(StringUtils.isNotEmpty(logId)){
		boolean flag = CommentLogs.deleteLog(new Integer(logId));
		if(flag){
			out.print("success");
		}else{
			out.print("fail");
		}
	}else{
		out.print("fail");
	}
%>