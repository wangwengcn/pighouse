package com.pighouse.server.domain;

import java.util.Date;

public class Comment {

	private Long id;
	private String content;
	private Date createTime;
	// relations
	private User createUser;
	private Topic topic;
	
	public Topic getTopic() {
		return topic;
	}
	public void setTopic(Topic topic) {
		this.topic = topic;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getCreateTime() 
	{
		return createTime;
	}
	public void setCreateTime(Date createTime) 
	{
		this.createTime = createTime;
	}
	public String getContent() 
	{
		return content;
	}
	public void setContent(String content) 
	{
		this.content = content;
	}
	public User getCreateUser() 
	{
		return createUser;
	}
	public void setCreateUser(User createUser) 
	{
		this.createUser = createUser;
	}
}
