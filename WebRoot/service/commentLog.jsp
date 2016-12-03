<%@page import="org.apache.struts2.json.JSONUtil"%>
<%@page import="com.marlon.dao.log.CommentLogs"%>
<%@page import="com.marlon.bean.CommentLog"%>
<%@page import="com.marlon.util.StringUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String content = request.getParameter("content");
	String logId = request.getParameter("logId");
	if(StringUtils.isNotEmpty(content)){
		CommentLog commentlog = new CommentLog();
		commentlog.setContent(content);
		commentlog.setLogId(new Integer(logId));
		commentlog.setUserId(1);
		boolean flag = CommentLogs.saveCommentLog(commentlog);
		HashMap<String,Object> cmtMap = CommentLogs.findCmtLogs(new Integer(logId));
		if(flag){
			out.print(JSONUtil.serialize(cmtMap)); 
		}else{
			out.print("fail");
		}
	 }
%>