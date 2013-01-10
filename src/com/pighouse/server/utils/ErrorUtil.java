package com.pighouse.server.utils;

import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;

import com.pighouse.server.domain.vo.AjaxResult;
import com.pighouse.server.domain.vo.ErrorMessage;

public final class ErrorUtil {
	
	public static final String ACCOUNT_NOT_EXIST = "该账号不存在";
	public static final String PASSWORD_NOT_MATCH = "该账号与密码不匹配";
	
	public static ErrorMessage createErrorMessage(String propertyName, String errorMessage)
	{
		ErrorMessage message = new ErrorMessage();
		message.setPropertyName(propertyName);
		message.setErrorMessage(errorMessage);
		return message;
	}
	
	public static void dealWithBindErrors(AjaxResult obj, BindingResult result)
	{
		for(ObjectError objectError : result.getAllErrors())
		{
			if(objectError instanceof FieldError)
			{
				ErrorMessage errorMessage = new ErrorMessage();
				errorMessage.setPropertyName(((FieldError)objectError).getField());
				errorMessage.setErrorMessage(objectError.getDefaultMessage());
				obj.addErrorMessage(errorMessage);
			}
		}
	}
	
	public static void dealWithBindErrors(AjaxResult obj, BindingResult result, String[] orgNames, String[] replaceNames)
	{
		for(ObjectError objectError : result.getAllErrors())
		{
			if(objectError instanceof FieldError)
			{
				String fieldName = ((FieldError)objectError).getField();
				for(int i=0; i<orgNames.length; i++)
				{
					if(fieldName.equals(orgNames[i]))
					{
						fieldName = replaceNames[i];
					}
				}
				ErrorMessage errorMessage = new ErrorMessage();
				errorMessage.setPropertyName(fieldName);
				errorMessage.setErrorMessage(objectError.getDefaultMessage());
				obj.addErrorMessage(errorMessage);
			}
		}
	}
}
