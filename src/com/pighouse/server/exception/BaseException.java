package com.pighouse.server.exception;

public class BaseException extends Exception {

	private static final long serialVersionUID = 5552587057005483082L;
	
	private String message;
	
	public String getMessage() {
		return message;
	}

	public BaseException()
	{
		
	}
	
	public BaseException(String message)
	{
		this.message = message;
	}
}
