<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.marlon.dao.log.TmLogDao"%>
<%@page import="com.marlon.util.StringUtils"%>
<%
	List<HashMap<String,Object>> logMaps = TmLogDao.findUserLogs();
	request.setAttribute("logMaps", logMaps);
	request.getRequestDispatcher("template.jsp").forward(request, response);
%>