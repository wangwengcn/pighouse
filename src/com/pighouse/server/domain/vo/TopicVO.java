package com.pighouse.server.domain.vo;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import com.pighouse.server.domain.Comment;
import com.pighouse.server.domain.TopicPicture;
import com.pighouse.server.domain.User;
import com.pighouse.server.utils.JaxbDateAdapter;

@XmlRootElement(name="topic")
public class TopicVO extends AjaxResult{
	
	private String title;
	private User createUser;
	private Date createTime;
	private Date lastUpdateTime;
	private List<Comment> comments;
	private Set<TopicPicture> pictures;
	private int commentNumber;
	
	public Set<TopicPicture> getPictures() {
		return pictures;
	}
	public void setPictures(Set<TopicPicture> pictures) {
		this.pictures = pictures;
	}
	public String getTitle() {
		return title;
	}
	public TopicVO setTitle(String title) {
		this.title = title;
		return this;
	}
	public User getCreateUser() {
		return createUser;
	}
	public TopicVO setCreateUser(User createUser) {
		this.createUser = createUser;
		return this;
	}
	@XmlJavaTypeAdapter(JaxbDateAdapter.class)
	public Date getCreateTime() {
		return createTime;
	}
	public TopicVO setCreateTime(Date createTime) {
		this.createTime = createTime;
		return this;
	}
	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}
	public TopicVO setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
		return this;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public TopicVO setComments(List<Comment> comments) {
		this.comments = comments;
		return this;
	}
	public int getCommentNumber() {
		return commentNumber;
	}
	public TopicVO setCommentNumber(int commentNumber) {
		this.commentNumber = commentNumber;
		return this;
	}
}
