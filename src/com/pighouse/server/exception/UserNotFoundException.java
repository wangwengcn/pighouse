package com.pighouse.server.exception;

public class UserNotFoundException extends BaseException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3108984778649745924L;
	
	public UserNotFoundException()
	{
		
	}
	
	public UserNotFoundException(String message)
	{
		super(message);
	}

}
