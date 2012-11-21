package com.pighouse.server.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.pighouse.server.dao.UserDAO;
import com.pighouse.server.domain.User;
import com.pighouse.server.service.UserService;

public class UserServiceImpl implements UserService {
	
	/**
	 * config for spring
	 */
	@Autowired
	private UserDAO userDAO;

	public void setDao(UserDAO dao) {
		this.userDAO = dao;
	}
	
	@Override
	public List<User> getAllUsers() {
		return userDAO.getAllUsers();
	}

	@Override
	public User getUsersById(Long userId) {
		return userDAO.getUsersById(userId);
	}

	@Override
	public User addUser(User user) {
		return userDAO.addUser(user);
	}

	@Override
	public User updateUser(User user) {
		return userDAO.updateUser(user);
	}

	@Override
	public User getUsersByEmail(String email) {
		return userDAO.getUsersByEmail(email);
	}

	@Override
	public User getUsersByDisplayName(String displayName) {
		return userDAO.getUsersByDisplayName(displayName);
	}

}
