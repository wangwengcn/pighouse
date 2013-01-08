package com.pighouse.server.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.pighouse.server.constants.UserConstant;
import com.pighouse.server.domain.User;

public class SessionUtil {

	public static void setAttribute(String key, Object value, HttpServletRequest request) {
		request.getSession().setAttribute(key, value);
	}
	
	public static void setAttribute(String key, Object value, HttpSession session) {
		session.setAttribute(key, value);
	}
	
	public static void removeAttribute(String key, HttpServletRequest request) {
		request.getSession().removeAttribute(key);
	}
	
	public static void removeAttribute(String key, HttpSession session) {
		session.removeAttribute(key);
	}
	
	public static void addLogin(User puser, HttpServletRequest request) {
		setAttribute(UserConstant.LOGIN_USER, puser, request);
	}
	
	public static void addLogout(HttpServletRequest request) {
		removeAttribute(UserConstant.LOGIN_USER, request);
	}
	
	public static Object getAttribute(String key, HttpServletRequest request) {
		return request.getSession().getAttribute(key);
	}
	
	public static Object getAttribute(String key, HttpSession session) {
		return session.getAttribute(key);
	}
	
	public static Boolean getloginFlag(HttpServletRequest request) {
		return request.getSession().getAttribute(UserConstant.LOGIN_USER) != null;
	}

}
