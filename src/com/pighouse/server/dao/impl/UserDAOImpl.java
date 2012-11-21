package com.pighouse.server.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.pighouse.server.dao.UserDAO;
import com.pighouse.server.domain.User;

public class UserDAOImpl implements UserDAO {
	
	private static final String GET_USERS_BY_EMAIL 
		= "select distinct user from User user where user.email = :email";
	
	private static final String GET_USERS_BY_DISPLAYNAME 
		= "select distinct user from User user where user.displayName = :displayName";
	
	private static final String GET_ALL_USERS 
		= "select distinct user from User user";

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUsers() 
	{
		List<User> list = (List<User>)hibernateTemplate.find(GET_ALL_USERS);
		return list;
	}

	@Override
	public User getUsersById(Long userId) 
	{
		return hibernateTemplate.get(User.class, userId);
	}

	@Override
	public User addUser(User user) 
	{
		hibernateTemplate.saveOrUpdate(user);
		return user;
	}

	@Override
	public User updateUser(User user) 
	{
		hibernateTemplate.saveOrUpdate(user);
		return user;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public User getUsersByEmail(String email) 
	{
		List<User> list = hibernateTemplate.findByNamedParam(GET_USERS_BY_EMAIL,
						new String[]{"email"},
						new Object[]{email});
		if(list.size() > 0)
		{
			return list.get(0);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public User getUsersByDisplayName(String displayName) {
		List<User> list = hibernateTemplate.findByNamedParam(GET_USERS_BY_DISPLAYNAME,
						new String[]{"displayName"},
						new Object[]{displayName});
		if(list.size() > 0)
		{
			return list.get(0);
		}
		return null;
	}

	/**
	 * config for spring
	 */
	@Autowired
	private HibernateTemplate hibernateTemplate;
}
