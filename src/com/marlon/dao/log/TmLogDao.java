package com.marlon.dao.log;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import com.marlon.bean.TzLog;
import com.marlon.dao.ConnectionUtil;

public class TmLogDao {
	//1:查询用户发表的日记
	/**
	 * 根据用户ID查询对应的日记信息
	 * 方法名：findLogs<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2015年4月26日-下午4:00:09 <BR>
	 * @return List<HashMap<String,Object>><BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static List<HashMap<String, Object>> findLogs(int userId){
		String sql = "select * from tz_log where user_id = "+ userId + " order by id desc ";
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		List<HashMap<String, Object>> maps = null;
		try {
			maps = new ArrayList<HashMap<String,Object>>();
			conn = ConnectionUtil.getConnection();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			HashMap<String, Object> map = null;
			while(rs.next()){
				//索引列表法  索引标号必须从1开始
				map = new HashMap<String, Object>();
				map.put("id", rs.getInt("id"));
				map.put("title", rs.getString("title"));
				map.put("content", rs.getString("content"));
				map.put("createtime", rs.getTimestamp("createtime"));
				map.put("updatetime", rs.getDate("updatetime"));
				map.put("user_id", rs.getInt("user_id"));
				maps.add(map);
			}
			return maps;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally{
			ConnectionUtil.closeResultset(rs);
			ConnectionUtil.closeSt(st);
			ConnectionUtil.closeConnection(conn);
		}
	}
	/**
	 * 管理员查询所有留言信息
	 * 方法名：findLogs<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2015年6月20日-下午4:01:39 <BR>
	 * @return List<HashMap<String,Object>><BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static List<HashMap<String, Object>> findUserLogs(){
		String sql = "select * from tz_log order by id desc ";
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		List<HashMap<String, Object>> maps = null;
		try {
			maps = new ArrayList<HashMap<String,Object>>();
			conn = ConnectionUtil.getConnection();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			HashMap<String, Object> map = null;
			while(rs.next()){
				//索引列表法  索引标号必须从1开始
				map = new HashMap<String, Object>();
				map.put("id", rs.getInt("id"));
				map.put("title", rs.getString("title"));
				map.put("content", rs.getString("content"));
				map.put("createtime", rs.getTimestamp("createtime"));
				map.put("updatetime", rs.getDate("updatetime"));
				map.put("user_id", rs.getInt("user_id"));
				maps.add(map);
			}
			return maps;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally{
			ConnectionUtil.closeResultset(rs);
			ConnectionUtil.closeSt(st);
			ConnectionUtil.closeConnection(conn);
		}
	}
	/**
	 * 保存留言日志
	 * (特别注意：主键id自动递增很重要)<BR>
	 * 方法名：saveLogs<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2015年6月19日-上午11:36:09 <BR>
	 * @param log
	 * @return boolean<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static boolean saveLogs(TzLog log){
		String sql ="INSERT INTO tz_log(title,content,createtime,updatetime,user_id) VALUES(?,?,?,?,?)";
		Connection connection = null;
		PreparedStatement pStatement = null;
		try{
			connection = ConnectionUtil.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, log.getTitle());
			pStatement.setString(2, log.getContent());
			pStatement.setDate(3, log.getCreatetime());
			pStatement.setDate(4, log.getUpdatetime());
			pStatement.setInt(5, log.getUserId());
			int count = pStatement.executeUpdate();
			return count>0?true:false;
		}catch(Exception e){
			return false;
		}finally{
			ConnectionUtil.closeStatement(pStatement);
			ConnectionUtil.closeConnection(connection);
		}
	}
	public static TzLog saveLog(TzLog log){
		String sql ="INSERT INTO tz_log(title,content,createtime,updatetime,user_id) VALUES(?,?,?,?,?)";
		Connection connection = null;
		PreparedStatement pStatement = null;
		try{
			connection = ConnectionUtil.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, log.getTitle());
			pStatement.setString(2, log.getContent());
			pStatement.setDate(3, log.getCreatetime());
			pStatement.setDate(4, log.getUpdatetime());
			pStatement.setInt(5, log.getUserId());
			int count = pStatement.executeUpdate();
			return count > 0 ? log : null;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			ConnectionUtil.closeStatement(pStatement);
			ConnectionUtil.closeConnection(connection);
		}
	}
    public static void main(String[] args) {
    	 /*测试查询留言信息*/
   /* 	  List<HashMap<String, Object>> maps = findLogs(1);
    	  List<HashMap<String, Object>> maps = findUserLogs();
	    	for (HashMap<String, Object> map : maps) {
	    		System.out.print(map.get("id")+"\t");
				System.out.print(map.get("title")+"\t");
				System.out.print(map.get("content")+"\t");
				System.out.print(map.get("createtime")+"\t");
				System.out.print(map.get("updatetime")+"\t");
				System.out.println(map.get("user_id")+"\t");
			}*/
		
    	/*	留言日志测试
    	 *  TzLog log = new TzLog();
	    	log.setTitle("111");
	    	log.setContent("222");
	    	log.setUserId(1);
			boolean flag = saveLogs(log);
			if(flag){
				System.out.println("保存成功");
			}else{
				System.out.println("保存失败");
			}
		*/
    	/*TzLog log = new TzLog();
    	log.setTitle("111");
    	log.setContent("222");
    	log.setUserId(1);
		TzLog flag = saveLog(log);
		System.out.println(flag.getContent()+"===="+flag.getTitle());*/
    }
}
