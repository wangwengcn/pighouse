package com.pighouse.server.service;

import java.util.List;

import com.pighouse.server.domain.User;

public interface UserService {
	
	public List<User> getAllUsers();
	
	public User getUsersById(Long userId);
	
	public User addUser(User user);
	
	public User updateUser(User user);
	
	public User getUsersByEmail(String email);
	
	public User getUsersByDisplayName(String displayName);
}
