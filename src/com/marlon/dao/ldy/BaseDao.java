/**
 * 项目名称<BR>
 * com.ldy.dao<BR>
 * BaseDao.java<BR>
 * 创建人:LeeDongYang <BR>
 * 时间：2014年12月11日-下午10:49:32<BR> 
 * 2014XXXX公司-版权所有
 */
package com.marlon.dao.ldy;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 * 数据库核心工具类 	
 * 类名:BaseDao<BR>
 * 创建人:马龙<BR>
 * 时间：2014年12月16日-下午12:07:21 <BR>
 * @version 1.0.0
 */
public class BaseDao {
	private static final String DRIVER="com.mysql.jdbc.Driver"; //数据库驱动
	private static final String URL="jdbc:mysql://localhost:3306/marlon"; //数据库链接URL
	private static final String USER="root"; //数据库用户名
	private static final String PWD="marlon"; //数据库密码
	protected Connection conn =null; //数据库链接对象
	protected PreparedStatement pstmt =null; //预执行
	protected ResultSet rs =null; //结果集对象
	/**
	 * 数据库连接	<BR>
	 * 方法名：getConnection<BR>
	 * 创建人：马龙<BR>
	 * 时间：2014年12月16日-下午12:07:21 <BR>
	 * @return void<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public void getConnection(){
		try {
			Class.forName(DRIVER); //加载数据库驱动
			conn =DriverManager.getConnection(URL,USER,PWD); //建立数据库链接
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 查询公共方法<BR>
	 * 方法名：getResultSet<BR>
	 * 创建人：马龙 <BR>
	 * 时间：2014年12月11日-下午10:56:09 <BR>
	 * @param sql 执行的sql语句
	 * @param prams 参数列表
	 * @return ResultSet ResultSet结果集<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public ResultSet getResultSet(String sql,String ... prams){
		try {
			getConnection(); //获得数据库链接
			pstmt = conn.prepareStatement(sql);
			if (prams!=null && prams.length>0) {
				for(int i =0;i<prams.length; i++){
					pstmt.setObject(i+1, prams[i]);
				}
			}
			rs=pstmt.executeQuery(); //执行查询并返回结果集
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	/**
	 * 增，删，改的公共方法<BR>
	 * 方法名：Update<BR>
	 * 创建人：马龙 <BR>
	 * 时间：2014年12月11日-下午10:57:24 <BR>
	 * @param sql sql语句
	 * @param prams 参数列表
	 * @return int 如果返回值大于0，增，删，改成功，否则失败！<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public int Update(String sql,Object ... prams){
		int result=0;
		try {
			getConnection(); //获取数据库链接
			pstmt = conn.prepareStatement(sql);
			if (prams!=null && prams.length>0) {
				for(int i=0; i<prams.length;i++){
					pstmt.setObject(i+1, prams[i]);
				}
			}
			result= pstmt.executeUpdate(); //执行更新，并返回受影响的行数
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			CloseAll(conn, pstmt, rs);
		}
		return result;
	}
	/**
	 * 释放资源工具<BR>
	 * 方法名：CloseAll<BR>
	 * 创建人：马龙 <BR>
	 * 时间：2014年12月11日-下午10:59:06 <BR>
	 * @param conn 数据库链接对象
	 * @param pstmt 预执行对象
	 * @param rs 结果集对象
	 * @return void<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public final void CloseAll(Connection conn, PreparedStatement pstmt, ResultSet rs){
		try {
			if (rs!=null) { //若结果集对象不为空，则关闭
				rs.close();
			}
			if (pstmt!=null) {//若PreparedStatement对象不为空，则关闭
				pstmt.close();
			}
			if (conn!=null) { //若链接对象不为空，则关闭
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}