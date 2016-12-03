
/**
 * 项目名称<BR>
 * com.ldy.servlet<BR>
 * LoginServlet.java<BR>
 * 创建人:LeeDongYang <BR>
 * 时间：2014年12月25日-下午2:42:14<BR> 
 * 2014XXXX公司-版权所有
 */
package com.marlon.core.ldy;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marlon.bean.ldy.User;
import com.marlon.dao.ldy.UserDao;

/**
 * 
 * 类名:LoginServlet<BR>
 * 创建人:马龙 <BR>
 * 时间：2014年12月25日-下午2:42:14 <BR>
 * @version 1.0.0
 * 
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String userName=request.getParameter("username");
		String pwd =request.getParameter("pwd");
		UserDao userDao = new UserDao();
	    User user=	userDao.login(userName, pwd);
		PrintWriter out= response.getWriter();
	    if(user !=null){
	    	request.setAttribute("userName", userName);
	    	request.getRequestDispatcher("index.jsp").forward(request, response); //转发到welcome.jsp页面中去
	    }else{
	    	request.setAttribute("error", "登录失败！！");
	    	request.setAttribute("userName", userName);
	    	request.getRequestDispatcher("login.jsp").forward(request, response);
	    }
	}

}
