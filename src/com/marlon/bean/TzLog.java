package com.marlon.bean;

import java.sql.Date;

public class TzLog implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	private String title;
	private String content;
	private Date createtime;
	private Date updatetime;
	private Integer userId;
	
	//构造方法
	public TzLog(){
		
	}
	public TzLog(Integer id){
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}