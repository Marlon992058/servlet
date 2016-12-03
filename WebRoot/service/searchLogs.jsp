<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.marlon.dao.log.TmLogDao"%>
<%@page import="com.marlon.util.StringUtils"%>
<%
	String userId = request.getParameter("userId");
	List<HashMap<String,Object>> logMaps = TmLogDao.findLogs(new Integer(userId));
	session.setAttribute("logMaps", logMaps);
	request.getRequestDispatcher("template.jsp").forward(request, response);
%>