package com.pighouse.server.domain;

import java.util.Date;
import java.util.Set;

public class Topic {
	
	private Long id;
	private String title;
	private String descript;
	private Date createTime;
	private Date lastUpdateTime;
	// relations
	private Set<Comment> comments;
	private TopicType topicType;
	private User createUser;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public TopicType getTopicType() {
		return topicType;
	}
	public void setTopicType(TopicType topicType) {
		this.topicType = topicType;
	}
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public User getCreateUser() {
		return createUser;
	}
	public void setCreateUser(User createUser) {
		this.createUser = createUser;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	
	
	
}
