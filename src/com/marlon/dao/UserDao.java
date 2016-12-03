package com.marlon.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.marlon.bean.User;

/**
 * 用户实体类 
 * UserDao<BR>
 * 创建人:Marlon<BR>
 * 时间：2016年3月5日-下午4:02:45 <BR>
 * @version 1.0.0
 *
 */
public class UserDao {
	/**
	 * (保存用户信息)<BR>
	 * 方法名：saveUser<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2016年3月5日-下午4:02:45 <BR>
	 * @param user
	 * @return User<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static User saveUsers(User user){
		String sql = "INSERT into tz_users(account,idcard,password,type,status,pay,contact,jointime) VALUES(?,?,?,?,?,?,?,?)";
		Connection connection = null;
		PreparedStatement pStatement = null;
		try{
			//获取连接对象
			connection = ConnectionUtil.getConnection();
			//预处理块
			pStatement = connection.prepareStatement(sql);
			//设置参数
			pStatement.setString(1, user.getAccount());
			pStatement.setString(2, user.getIdcard());
			pStatement.setString(3, user.getPassword());
			pStatement.setInt(4, user.getType());
			pStatement.setInt(5, user.getStatus());
			pStatement.setInt(6, user.getPay());
			pStatement.setString(7, user.getContact());
			pStatement.setDate(8, user.getJointime());
			//执行sql
			int count = pStatement.executeUpdate();
			//return count>0?true:false;
			if(count>0){
				ResultSet rs =  pStatement.getGeneratedKeys();
				if(rs.next()){
					user.setId(rs.getInt(1));
				}
				return user;
			}else{
				return null;
			}
		}catch(Exception ex){
			return null;
		}finally{
			ConnectionUtil.closeStatement(pStatement);
			ConnectionUtil.closeConnection(connection);
		}
	}
	/**
	 * 保存用户
	 * 方法名：saveUser<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2016年3月5日-下午4:02:45 <BR>
	 * @param user
	 * @return boolean<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static boolean saveUser(User user){
		String sql = "INSERT into tz_users(account,password,idcard,type,pay,contact,status) VALUES(?,?,?,?,?,?,?) ";
		Connection connection = null;
		PreparedStatement pStatement = null;
		try{
			//获取连接对象
			connection = ConnectionUtil.getConnection();
			//预处理块
			pStatement = connection.prepareStatement(sql);
			//设置参数
			pStatement.setString(1, user.getAccount());
			pStatement.setString(2, user.getPassword());
			pStatement.setString(3, user.getIdcard());
			pStatement.setInt(4, user.getType());
			pStatement.setInt(5, user.getPay());
			pStatement.setString(6, user.getContact());
			pStatement.setInt(7, user.getStatus());
			//执行sql
			int count = pStatement.executeUpdate();
			return count > 0 ? true : false;
		}catch(Exception ex){
			return false;
		}finally{
			ConnectionUtil.closeStatement(pStatement);
			ConnectionUtil.closeConnection(connection);
		}
	}

	/**
	 * 判断用户是否报名 
	 * 方法名：isExistUser<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2016年3月5日-下午4:02:45 <BR>
	 * @param account
	 * @param password
	 * @return User<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static User isExistUser(String account,String password){
		String sql = "select * from tz_users where account= ? and password = ? and status =  1 ";
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		User user = null;
		try {
			connection = ConnectionUtil.getConnection();
			statement = connection.prepareStatement(sql);
			statement.setString(1, account);
			statement.setString(2, password);
			rs = statement.executeQuery();
			if(rs.next()){
				user = new User();
				user.setId(rs.getInt("id"));
				user.setAccount(rs.getString("account"));
				user.setIdcard(rs.getString("idcard"));
				user.setPassword(rs.getString("password"));
				user.setType(rs.getInt("type"));
				user.setStatus(rs.getInt("status"));
				user.setPay(rs.getInt("pay"));
				user.setContact(rs.getString("contact"));
				user.setJointime(rs.getDate("jointime"));
			}
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally{
			ConnectionUtil.closeResultset(rs);
			ConnectionUtil.closeStatement(statement);
			ConnectionUtil.closeConnection(connection);
		}
	}
	/**
	 * 根据account查找用户信息？account一定要唯一
	 * 方法名：getUser<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2016年3月5日-下午4:02:45 <BR>
	 * @param account
	 * @return User<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static User getUser(String account){
		String sql = "select * from tz_users where account= ? and status =  1 ";
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		User user = null;
		try {
			connection = ConnectionUtil.getConnection();
			statement = connection.prepareStatement(sql);
			statement.setString(1, account);
			rs = statement.executeQuery();
			if(rs.next()){
				user = new User();
				user.setId(rs.getInt("id"));
				user.setAccount(rs.getString("account"));
				user.setIdcard(rs.getString("idcard"));
				user.setPassword(rs.getString("password"));
				user.setType(rs.getInt("type"));
				user.setStatus(rs.getInt("status"));
				user.setPay(rs.getInt("pay"));
				user.setContact(rs.getString("contact"));
				user.setJointime(rs.getDate("jointime"));
			}
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally{
			ConnectionUtil.closeResultset(rs);
			ConnectionUtil.closeStatement(statement);
			ConnectionUtil.closeConnection(connection);
		}
	}
	/**
	 * 查询所有VIP学员信息
	 * 方法名：findUsers<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2016年3月5日-下午4:02:45 <BR>
	 * @param pageNo
	 * @param pageSize
	 * @return List<User><BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static List<User> findUser(Integer pageNo,Integer pageSize){
		StringBuilder builder = new StringBuilder();
		builder.append(" SELECT * from tz_users WHERE status='1' ");
		builder.append(" order by id asc ");
		builder.append(" limit ?,? ");
		String sql = builder.toString();
		Connection connection = null;
		PreparedStatement pStatement = null;
		ResultSet rs = null;
		List<User> users = null;
		try{
			//获取连接对象
			connection = ConnectionUtil.getConnection();
			//预处理快
			pStatement = connection.prepareStatement(sql);
			//设置分页的参数和查询出来页面显示的条数
			pStatement.setInt(1, pageNo);
			pStatement.setInt(2, pageSize);
			//处理结果集
			rs = pStatement.executeQuery();
			users = new ArrayList<User>();
			User user = null;
			while(rs.next()){//测试时出现单条记录是因为用了if如果是多条就用while而查询的话一般都是while不要用if
				user = new User();
				user.setId(rs.getInt("id"));
				user.setAccount(rs.getString("account"));
				user.setIdcard(rs.getString("idcard"));
				user.setPassword(rs.getString("password"));
				user.setType(rs.getInt("type"));
				user.setStatus(rs.getInt("status"));
				user.setPay(rs.getInt("pay"));
				user.setContact(rs.getString("contact"));
				user.setJointime(rs.getDate("jointime"));
				users.add(user);
			}
			return users;
		}catch(SQLException ex){
			ex.printStackTrace();
			return null;
		}finally{
			ConnectionUtil.closeResultset(rs);
			ConnectionUtil.closeStatement(pStatement);
			ConnectionUtil.closeConnection(connection);
		}
	}
	/**
	 * 根据ID查找更新的用户
	 * 方法名：findUsers<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2016年3月5日-下午4:02:45 <BR>
	 * @return List<User><BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static User findUpdateUser(Integer id){
		String sql = " SELECT * from tz_users WHERE status='1' and id= "+id;
		Connection connection = null;
		java.sql.Statement pStatement = null;
		ResultSet rs = null;
		try{
			//获取连接对象
			connection = ConnectionUtil.getConnection();
			//预处理快
			pStatement = connection.createStatement();
			//处理结果集
			rs = pStatement.executeQuery(sql);
			User user = null;
			if(rs.next()){//测试时出现单条记录是因为用了if如果是多条就用while而查询的话一般都是while不要用if
				user = new User();
				user.setId(rs.getInt("id"));
				user.setAccount(rs.getString("account"));
				user.setIdcard(rs.getString("idcard"));
				user.setPassword(rs.getString("password"));
				user.setType(rs.getInt("type"));
				user.setStatus(rs.getInt("status"));
				user.setPay(rs.getInt("pay"));
				user.setContact(rs.getString("contact"));
				user.setJointime(rs.getDate("jointime"));
			}
			return user;
		}catch(SQLException ex){
			ex.printStackTrace();
			return null;
		}finally{
			ConnectionUtil.closeResultset(rs);
			if(pStatement!=null)
				try {
					pStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			ConnectionUtil.closeConnection(connection);
		}
	}
	/**
	 * 根据ID删除VIP学员
	 * 方法名：deleteUser<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2016年3月5日-下午4:02:45 <BR>
	 * @param id
	 * @return boolean<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static boolean deleteUser(Integer id){
		String sql = "DELETE FROM tz_users WHERE id= ?";
		Connection connection = null;
		PreparedStatement pStatement = null;
		try{
			//获取连接对象
			connection = ConnectionUtil.getConnection();
			//预处理快
			pStatement = connection.prepareStatement(sql);
			//设置参数
			pStatement.setInt(1,id);
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
	/**
	 * 根据ID修改其他相应的信息
	 * 方法名：modifyUser<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2016年3月5日-下午4:02:45 <BR>
	 * @param account
	 * @param idcard
	 * @param type
	 * @param pay
	 * @param contact
	 * @param id
	 * @return boolean<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static boolean modifyUser(String account,String idcard,Integer type,Integer pay,String contact,Integer id){
		String sql = "update tz_users SET account = ?,idcard=?,type=?,pay=?,contact=? WHERE id = ?";
		Connection connection = null;
		PreparedStatement pStatement = null;
		try{
			//获取连接对象
			connection = ConnectionUtil.getConnection();
			//预处理快
			pStatement = connection.prepareStatement(sql);
			//设置参数
			pStatement.setString(1,account);
			pStatement.setString(2,idcard);
			pStatement.setInt(3,type);
			pStatement.setInt(4,pay);
			pStatement.setString(5,contact);
			pStatement.setInt(6,id);
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
	/**
	 * 查询VIP学员总人数
	 * (这里用一句话描述这个方法的作用)<BR>
	 * 方法名：countUsers<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2016年3月5日-下午4:02:45 <BR>
	 * @return int<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	public static int countUsers(){
		String sql = "select count(1) from tz_users where status = 1;";//查询没有删除的用户信息
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		try{
			//获取获取库链接对象
			connection = ConnectionUtil.getConnection();
			statement = connection.prepareStatement(sql);
			//设置页面和查询记录数
			rs = statement.executeQuery();
			int count = 0;
			if(rs.next()){
				count = rs.getInt(1);
			}
			return count;
		}catch(Exception ex){
			ex.printStackTrace();
			return 0;
		}finally{
			ConnectionUtil.closeResultset(rs);
			ConnectionUtil.closeStatement(statement);
			ConnectionUtil.closeConnection(connection);
		}
	}
	/**
	 * 根据ID修改学员姓名
	 * (这里用一句话描述这个方法的作用)<BR>
	 * 方法名：updateUser<BR>
	 * 创建人：Marlon<BR>
	 * 时间：2016年3月5日-下午4:02:45 <BR>
	 * @param id
	 * @param account
	 * @return boolean<BR>
	 * @exception <BR>
	 * @since  1.0.0
	 */
	/*public static boolean updateUser(Integer id,User user){
		String sql = "update tz_users SET account = ? WHERE id = ?";
		Connection connection = null;
		PreparedStatement pStatement = null;
		try{
			//获取连接对象
			connection = ConnectionUtil.getConnection();
			//预处理快
			pStatement = connection.prepareStatement(sql);
			//设置参数
			pStatement.setString(1,user);
			pStatement.setInt(2,id);
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
	}*/
	public static void main(String[] args) {
		/*测试计算VIP总人数
		 * int count = countUsers();
		System.out.println(count);*/
		/*boolean flag = modifyUser("keke","1234567",5,2,"12345670",23);
		System.out.println(flag);*/
	/*	User user = findUpdateUser(23);
		System.out.println(user.getAccount());*/
		/* 测试修改功能
		 * boolean flag = updateUser(18, "乔丹");
		   System.out.println(flag);
		 */
		/* 测试删除VIP
		 * boolean flag = deleteUser(7);
		   System.out.println(flag);
		*/
		/* 测试查询VIP学员信息
		 * List<User> users = findUsers(1, 10);
			for (User user : users) {
				System.out.println(user.getAccount()+"=="+user.getIdcard());
			}
		*/
 		/*
 		 *  User user = new User();
			user.setId(3);
			user.setAccount("马龙");
			user.setPassword("marlon");
			user.setIdcard("622724199309061512");
			user.setType(1);
			user.setStatus(1);
			user.setPay(1);
			user.setContact("18093454447");
			boolean flag = saveUser(user);
			if(flag){
				System.out.println("保存成功");
			}else{
				System.out.println("保存失败");
			}
		*/
	/*  测试用户报名添加	
	  	User user = new User();
		user.setId(1);
		user.setAccount("马龙");
		user.setIdcard("622724199309061512");
		user.setPassword("marlon");
		user.setType(1);
		user.setStatus(1);
		user.setPay(1);
		user.setContact("18093454447");
		System.out.println(user.getAccount());
		System.out.println(user.getId());
		System.out.println(user.getIdcard());
		System.out.println(user.getPassword());
		System.out.println(user.getPay());
		System.out.println(user.getContact());*/
	/*	
	 * 测试管理员是否存在
	 *  Admin admin = isExistUser("marlon", "marlon");
		System.out.println(admin.getAdmin()+"====="+admin.getStatus());
		*/
//		User user = isExistUser("keke", "keke");
//		System.out.println(user.getAccount()+"====="+user.getStatus());
	}
}
