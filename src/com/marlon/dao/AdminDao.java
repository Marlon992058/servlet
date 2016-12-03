package com.marlon.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.marlon.bean.Admin;

/**
 * 管理员实体类 
 * AdminDao<BR>
 * 创建人:Marlon<BR>
 * 时间：2015年6月9日-下午9:56:39 <BR>
 * @version 1.0.0
 *
 */
public class AdminDao {
	/**
	 * 判断管理员是否存在
	 * (这里用一句话描述这个方法的作用)<BR>
	 * 方法名：isExistUser<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2015年6月3日-上午11:21:33 <BR>
	 * @param username
	 * @param password
	 * @return Admin<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static Admin isExistAdmin(String username,String password){
		//java.sql.SQLException: Parameter index out of range (1 > number of parameters, which is 0).导致出错的原因是下面的sql语句
		String sql = "select * FROM tz_admin WHERE admin= ? and password= ? and status=1";
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		Admin admin = null;
		try {
			connection = ConnectionUtil.getConnection();
			statement = connection.prepareStatement(sql);
			statement.setString(1, username);
			statement.setString(2, password);
			rs = statement.executeQuery();
			if(rs.next()){
				admin = new Admin();
				admin.setId(rs.getInt("id"));
				admin.setAdmin(rs.getString("admin"));
				admin.setPassword(rs.getString("password"));
				admin.setCreatetime(rs.getTimestamp("createtime"));
				admin.setStatus(rs.getInt("status"));
			}
			return admin;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally{
			ConnectionUtil.closeResultset(rs);
			ConnectionUtil.closeStatement(statement);
			ConnectionUtil.closeConnection(connection);
		}
	}
}
