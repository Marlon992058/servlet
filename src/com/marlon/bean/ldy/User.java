

/**
 * 项目名称<BR>
 * com.ldy.entity<BR>
 * User.java<BR>
 * 创建人:LeeDongYang <BR>
 * 时间：2014年12月25日-下午1:12:38<BR> 
 * 2014XXXX公司-版权所有
 */
package com.marlon.bean.ldy;
/**
 * 
 * 类名:User<BR>
 * 创建人:马龙 <BR>
 * 时间：2014年12月25日-下午1:12:38 <BR>
 * @version 1.0.0
 * 
 */
public class User {

	private String user; //用户名
	
	private String userName; //用户姓名
	
	private long userId ; //身份证
	
	private String pwd ; //密码
	
	/*
	 * 0代表：请选择
	 * 1代表：java基础班
	 * 2代表：java中级班
	 * 3代表：java高级班
	 * 4代表：java系统学习班
	 * 5代表：java就业特训班
	 */
	private Integer classType; //班级类型
	
	/*
	 * 1代表：支付宝
	 * 2代表：网上银行
	 */
	private Integer fangShi; //支付方式
	
	private String phone; //联系电话

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Integer getClassType() {
		return classType;
	}

	public void setClassType(Integer classType) {
		this.classType = classType;
	}

	public Integer getFangShi() {
		return fangShi;
	}

	public void setFangShi(Integer fangShi) {
		this.fangShi = fangShi;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
}
