package com.pighouse.server.utils;

import java.util.Date;

import com.pighouse.server.domain.User;
import com.pighouse.server.domain.form.SignUpCredentialVo;

public final class VOConverter {
	
	public static final User converterSignUpCredentialVo(SignUpCredentialVo signUpCredentialVo)
	{
		User user = new User();
		Date date = new Date();
		user.setEmail(signUpCredentialVo.getSignUpUserName());
		user.setDisplayName(signUpCredentialVo.getDisplayName());
		user.setPassword(signUpCredentialVo.getSignUpPassword());
		user.setRegTime(date);
		user.setLastLoginTime(date);
		return user;
	}
}
