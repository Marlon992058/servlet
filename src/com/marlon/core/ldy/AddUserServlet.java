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
 * 类名:AddUserServlet<BR>
 * 创建人:马龙 <BR>
 * 时间：2014年12月25日-下午1:36:36 <BR>
 * @version 1.0.0
 * 
 */
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String user_ = request.getParameter("user"); //获取用户名
		String userName = request.getParameter("userName"); //获取用户姓名
		String userId = request.getParameter("userId"); //获取身份证
		String password = request.getParameter("password"); //获取密码
		//String passwords = request.getParameter("passwords"); //获取确认密码
		String risk = request.getParameter("risk"); //获取班级类型
		String zhiFuFangShi =request.getParameter("select"); //获取支付方式
		String tel = request.getParameter("tel"); //获取联系方式
		//实例化UserDao类的对象
		UserDao userDao = new UserDao();
		//实例化User类的对象
		User user= new User();
		//将获取到的数据封装到User对象中去
		user.setUser(user_);
		user.setUserName(userName);
		user.setUserId(Long.parseLong(userId));
		user.setPwd(password);
		user.setClassType(Integer.parseInt(risk));
		user.setFangShi(Integer.parseInt(zhiFuFangShi));
		user.setPhone(tel);
		int result =userDao.addUser(user);
		PrintWriter out= response.getWriter();
		if(result >0){
			out.println("<script type='text/javascript'>alert('注册成功,请登录！');location.href='login.jsp'</script>");
		}else{
			out.println("<script type='text/javascript'>alert('注册失败,请重新注册！');location.href='zhuce.jsp'</script>");
		}
	}
}