<%@page import="org.apache.struts2.json.JSONUtil"%>
<%@page import="com.marlon.dao.log.TmLogDao"%>
<%@page import="com.marlon.bean.TzLog"%>
<%@page import="com.marlon.util.StringUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String content = request.getParameter("content");
	String title = request.getParameter("title");
	String userId = request.getParameter("userId");
	if(StringUtils.isNotEmpty(content)&&StringUtils.isNotEmpty(title)){
		TzLog tzLog = new TzLog();
		tzLog.setTitle(title);
		tzLog.setContent(content);
		tzLog.setUserId(new Integer(userId));
		TzLog log = TmLogDao.saveLog(tzLog);
		out.print(JSONUtil.serialize(log)); 
		/*原始版本
		boolean flag = TmLogDao.saveLogs(tzLog);
		if(flag){
			out.print("success");
		}else{
			out.print("fail");
		} */
	}
%>