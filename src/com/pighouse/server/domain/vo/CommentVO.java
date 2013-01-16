package com.pighouse.server.domain.vo;

import java.util.Date;

import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import com.pighouse.server.utils.JaxbDateAdapter;

public class CommentVO {
	
	private String id;
	private String content;
	private Date createTime;
	// relations
	private String userId;
	private String userName;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@XmlJavaTypeAdapter(JaxbDateAdapter.class)
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
}
