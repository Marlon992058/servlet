package com.marlon.bean;

import java.sql.Date;
import java.sql.Timestamp;

public class CommentLog implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private String content;
	private Integer userId;
	private Integer logId;
	private Timestamp createtime;

	// 构造方法
	public CommentLog() {

	}

	public CommentLog(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getLogId() {
		return logId;
	}

	public void setLogId(Integer logId) {
		this.logId = logId;
	}

	public Timestamp getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}
}
