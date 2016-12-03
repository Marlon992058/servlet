<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.marlon.dao.UserDao,com.marlon.bean.User"%>
<%@page import="com.marlon.util.StringUtils"%>
<%@page import="org.apache.struts2.json.JSONUtil"%>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String cookieMark = request.getParameter("cookieMark");
	if(StringUtils.isNotEmpty(username)&&StringUtils.isNotEmpty(password)){
		User user = UserDao.isExistUser(username, password);
		if(user==null){
			out.print("fail");
		}else{
			out.print("success");
			//将用户信息存放在Session中让每个请求共享用户信息
			request.getSession().setAttribute("user", user);
			if(StringUtils.isNotEmpty(cookieMark) && cookieMark.equals("1")){
				//设置七天免登录功能
				//1：登录成功时记录cookie
				//2: 将用户名记录在cookie中
				Cookie cookie = new Cookie("user_key", username);
				//cookie时效设置
				cookie.setMaxAge(7*60*60*24);
				//3：写入cookie
				response.addCookie(cookie);
			}
		}
	}else{
		out.print("fail");
	}
%>