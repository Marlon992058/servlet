<%@page import="org.apache.struts2.json.JSONUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.marlon.dao.log.TmLogDao"%>
<%
	List<HashMap<String,Object>> logMaps = TmLogDao.findUserLogs();
	out.print(JSONUtil.serialize(logMaps)); 
%>