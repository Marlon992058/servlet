

/**
 * 项目名称<BR>
 * com.ldy.dao<BR>
 * UserDao.java<BR>
 * 创建人:LeeDongYang <BR>
 * 时间：2014年12月25日-下午1:22:01<BR> 
 * 2014XXXX公司-版权所有
 */
package com.marlon.dao.ldy;

import java.sql.SQLException;

import com.marlon.bean.ldy.User;

/**
 * 
 * 类名:UserDao<BR>
 * 创建人:马龙 <BR>
 * 时间：2014年12月25日-下午1:22:01 <BR>
 * @version 1.0.0
 * 
 */
public class UserDao extends BaseDao {
	
	/**
	 * 学员报名注册<BR>
	 * 方法名：addUser<BR>
	 * 创建人：马龙 <BR>
	 * 时间：2014年12月25日-下午1:22:45 <BR>
	 * @param user 对象
	 * @return int <BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public int addUser(User user){
		String sql ="INSERT INTO  [User] VALUES(?,?,?,?,?,?,?)";
		return 	this.Update(sql, user.getUser(),
						 user.getUserName(),
						 user.getUserId(),
						 user.getPwd(),
						 user.getClassType(),
						 user.getFangShi(),
						 user.getPhone());
	}
	
	/**
	 * 用户登录 <BR>
	 * 方法名：login<BR>
	 * 创建人：马龙 <BR>
	 * 时间：2014年12月25日-下午1:24:28 <BR>
	 * @param userName 用户名
	 * @param pwd 密码
	 * @return User<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public User login(String userName ,String pwd){
		String sql ="select [user],PWD from [User] where [user]=? and  pwd=?";
		rs = this.getResultSet(sql, userName,pwd);
		User user = null;
		try {
			if(rs.next()){
				user = new User();
				user.setUser(rs.getString("user"));
				user.setPwd(rs.getString("pwd"));	
			}
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			this.CloseAll(conn, pstmt, rs);
		}
		return null;
	}
}