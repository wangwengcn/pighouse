package com.pighouse.server.domain;

import java.util.Date;
import java.util.Set;

public class User {
	
	private Long userId;
	private String email;
	private String displayName;
	private String password;
	private Date regTime;
	private Date lastLoginTime;
	private Set<Topic> topics;
	private Set<User> myFocus;
	private Set<User> focusMe;
	
	public Set<Topic> getTopics() {
		return topics;
	}
	public void setTopics(Set<Topic> topics) {
		this.topics = topics;
	}
	public Set<User> getFocusMe() {
		return focusMe;
	}
	public void setFocusMe(Set<User> focusMe) {
		this.focusMe = focusMe;
	}
	public Set<User> getMyFocus() {
		return myFocus;
	}
	public void setMyFocus(Set<User> myFocus) {
		this.myFocus = myFocus;
	}
	public Date getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public Date getRegTime() {
		return regTime;
	}
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
