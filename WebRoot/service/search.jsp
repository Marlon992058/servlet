<%@page import="com.marlon.util.StringUtils"%>
<%@page import="org.apache.struts2.json.JSONUtil"%>
<%@page import="com.marlon.bean.User"%>
<%@page import="com.marlon.dao.UserDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	//当前页
	String pageNo = request.getParameter("pageNo");
	String pageSize = request.getParameter("pageSize");
	//调用查询出来的文件信息
	if(StringUtils.isEmpty(pageNo)) pageNo = "1";
	if(StringUtils.isEmpty(pageSize)) pageSize = "12";
	List<User> users = UserDao.findUser(new Integer(pageNo),new Integer(pageSize));
	int count = UserDao.countUsers();
	//request.setAttribute("count", count);
	//request.setAttribute("users", users);
	//request.getRequestDispatcher("template.jsp").forward(request, response);
	out.print(JSONUtil.serialize(users));
	
	/* 
		//作用里的数据
		request.setAttribute("resources", resources);
		request.setAttribute("itemcount", count);
		//跳转到我们的模板页面
		request.getRequestDispatcher("template.jsp").forward(request, response);
	*/
%>