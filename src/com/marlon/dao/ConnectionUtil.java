package com.marlon.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * 数据库连接类 
 * ConnectionUtil<BR>
 * 创建人:Marlon<BR>
 * 时间：2015年5月17日-下午4:49:24 <BR>
 * @version 1.0.0
 *
 */
public class ConnectionUtil {
	
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/marlon?useUnicode=true&characterEncoding=utf-8";
	private static final String ROOT = "root";
	private static final String PASSWORD = "marlon";
	
	/**
	 * 数据库连接方法
	 * 方法名：getConnection<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2015年5月17日-下午4:59:02 <BR>
	 * @return Connection<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static Connection getConnection(){
		Connection connection = null;
		try{
			Class.forName(DRIVER);
			connection = DriverManager.getConnection(URL, ROOT, PASSWORD);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return connection;
	}
	/**
	 * 关闭所有连接
	 * 方法名：closeAll<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2015年6月28日-上午9:11:27 <BR>
	 * @param connection
	 * @param statement
	 * @param rs void<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static void closeAll(Connection connection,PreparedStatement statement,ResultSet rs){
		try {
			if (rs!=null) { //若结果集对象不为空，则关闭
				rs.close();
			}
			if (statement!=null) {//若PreparedStatement对象不为空，则关闭
				statement.close();
			}
			if (connection!=null) { //若链接对象不为空，则关闭
				connection.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 关闭连接
	 * (这里用一句话描述这个方法的作用)<BR>
	 * 方法名：closeConnection<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2015年5月11日-下午5:30:41 <BR>
	 * @param rs void<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static void closeConnection(Connection connection){
		try{
			connection.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 关闭连接
	 * (这里用一句话描述这个方法的作用)<BR>
	 * 方法名：closeStatement<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2015年5月11日-下午5:30:41 <BR>
	 * @param rs void<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static void closeStatement(PreparedStatement pStatement){
		try{
			pStatement.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 关闭连接
	 * (这里用一句话描述这个方法的作用)<BR>
	 * 方法名：closeStatement<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2015年5月11日-下午5:30:41 <BR>
	 * @param rs void<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static void closeSt(Statement statement){
		try{
			statement.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 关闭连接
	 * (这里用一句话描述这个方法的作用)<BR>
	 * 方法名：closeResultset<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2015年5月11日-下午5:30:41 <BR>
	 * @param rs void<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static void closeResultset(ResultSet rs){
		try{
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
