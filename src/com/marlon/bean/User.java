package com.marlon.bean;

import java.sql.Date;

/**
 * 用户数据表 User<BR>
 * 创建人:Marlon<BR>
 * 时间：2015年5月17日-下午4:47:11 <BR>
 * @version 1.0.0
 * 
 */
public class User implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;// 主键
	private String account;// 用户名
	private String idcard;// 身份证号
	private String password;// 用户密码
	private Integer type;// 班级类型
	private Integer status;// 是否报名(1:已报名0：未报名)
	private Integer pay;// 支付方式(1：支付宝2:网银)
	private String contact;// 联系方式
	private Date jointime;// 加入时间

	public User() {

	}

	public User(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getPay() {
		return pay;
	}

	public void setPay(Integer pay) {
		this.pay = pay;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public Date getJointime() {
		return jointime;
	}

	public void setJointime(Date jointime) {
		this.jointime = jointime;
	}
}