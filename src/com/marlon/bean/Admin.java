package com.marlon.bean;

import java.util.Date;

public class Admin implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;// 主键
	private String admin;// 管理员
	private String password;// 密码
	private Date createtime;// 创建时间
	private Integer status;// 是否存在

	//构造方法
	public Admin(){
	}
	public Admin(Integer id){
		this.id = id;
	}
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}
