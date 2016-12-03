package com.marlon.core;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marlon.bean.User;
import com.marlon.dao.UserDao;

public class LoginFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)resp;
		String url = request.getRequestURI();
		//获取登陆session中的用户
		User user = (User)request.getSession().getAttribute("user");
		if(user==null && url.indexOf("login") ==-1 && url.indexOf("userDao")==-1){
			//5：如果Session用户失效，那么就去cookie中获取用户信息
			String username = null;
			Cookie[] cookies = request.getCookies();
			if(cookies!=null&&cookies.length>0){
				for (Cookie cookie : cookies) {
					if(cookie.getName().equalsIgnoreCase("user_key")){
						username = cookie.getValue();
						break;
					}
				}
				if(username!=null){
					//根据帐号(username)去数据表中查询===>防止用户篡改用户Cookie信息
					user = UserDao.getUser(username);
					if(user!=null){
						request.getSession().setAttribute("user", user);
						response.sendRedirect("/marlon/stage/index.jsp");
					}else{
						//用户不存在，跳转到登录页面登录去
						response.sendRedirect("/marlon/login.jsp");
					}
				}else{
					//用户没有登录，跳转到登录页面重新登录
					response.sendRedirect("/marlon/login.jsp");
				}
			}else{
				//用户没有登录，跳转到登录页面重新登录
				response.sendRedirect("/marlon/login.jsp");
			}
		}else{
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}
}
