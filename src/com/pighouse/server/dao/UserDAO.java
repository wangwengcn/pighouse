package com.pighouse.server.dao;

import java.util.List;

import com.pighouse.server.domain.User;

public interface UserDAO {

public List<User> getAllUsers();
	
	public User getUsersById(Long userId);
	
	public User getUsersByEmail(String email);
	
	public User getUsersByDisplayName(String displayName);
	
	public User addUser(User user);
	
	public User updateUser(User user);
}
