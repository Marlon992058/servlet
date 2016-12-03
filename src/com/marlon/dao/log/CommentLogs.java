package com.marlon.dao.log;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import com.marlon.bean.*;
import com.marlon.dao.ConnectionUtil;

/**
 * 留言评论类 
 * CommentLog<BR>
 * 创建人:Marlon<BR>
 * 时间：2015年6月20日-下午10:37:14 <BR>
 * @version 1.0.0
 *
 */
public class CommentLogs {
	/**
	 * 保存评论信息
	 * 方法名：saveCommentLog<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2015年6月22日-上午8:21:41 <BR>
	 * @param commentlog
	 * @return boolean<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static boolean saveCommentLog(CommentLog commentlog){
		String sql = "insert into tz_comment_log(content,createtime,log_id,user_id) VALUES (?,?,?,?) ";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = ConnectionUtil.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, commentlog.getContent());
			preparedStatement.setTimestamp(2, commentlog.getCreatetime());
			preparedStatement.setInt(3, commentlog.getLogId());
			preparedStatement.setInt(4, commentlog.getUserId());
			int count = preparedStatement.executeUpdate();
			return count > 0 ? true : false;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		} finally {
			ConnectionUtil.closeStatement(preparedStatement);
			ConnectionUtil.closeConnection(connection);
		}
	}
	/**
	 * 根据logId查找评论信息
	 * 方法名：findCmtLogs<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2015年6月22日-上午8:39:25 <BR>
	 * @param logId
	 * @return HashMap<String,Object><BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static HashMap<String,Object> findCmtLogs(Integer logId){
			String sql = "select * from tz_comment_log where log_id = "+logId;
			Connection connection = null;
			Statement statement = null;
			ResultSet rs = null;
			HashMap<String, Object> map = null;
			try {
				connection = ConnectionUtil.getConnection();
				statement = connection.createStatement();
				rs = statement.executeQuery(sql);
				if(rs.next()){
					map = new HashMap<String, Object>();
					map.put("id", rs.getInt("id"));
					map.put("content", rs.getString("content"));
					map.put("createtime", rs.getTimestamp("createtime"));
					map.put("log_id", rs.getInt("log_id"));
					map.put("user_id", rs.getInt("user_id"));
				}
				return map;
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}finally{
				ConnectionUtil.closeResultset(rs);
				ConnectionUtil.closeSt(statement);
				ConnectionUtil.closeConnection(connection);
			}
	}
	/**
	 * 根据logId删除CommentLog信息
	 * 方法名：deleteLog<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2015年6月22日-上午10:30:17 <BR>
	 * @param logId
	 * @return boolean<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static boolean deleteLog(Integer logId){
		String sql = "DELETE FROM tz_comment_log WHERE log_id= ?";
		Connection connection = null;
		PreparedStatement pStatement = null;
		try{
			//获取连接对象
			connection = ConnectionUtil.getConnection();
			//预处理快
			pStatement = connection.prepareStatement(sql);
			//设置参数
			pStatement.setInt(1,logId);
			//执行SQL
			int count = pStatement.executeUpdate();
			return count > 0 ? true : false;
		}catch(SQLException ex){
			ex.printStackTrace();
			return false;
		}finally{
			ConnectionUtil.closeStatement(pStatement);
			ConnectionUtil.closeConnection(connection);
		}
	}
	public static void main(String[] args) {
		/*
		 * HashMap<String, Object> map = findCmtLogs(1);
		 * System.out.println(map);
		 * {createtime=2015-06-22 08:35:05.0, content=可以优惠的, id=1, user_id=1, log_id=1}
		   */
		/*CommentLog comlog = new CommentLog();
		comlog.setContent("就这样");
		comlog.setLogId(1);
		comlog.setUserId(1);
		boolean flag = saveCommentLog(comlog);
		if(flag){
			System.out.println("保存成功！");
		}else{
			System.out.println("保存失败");
		}*/
	}
}
