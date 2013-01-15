package com.pighouse.server.domain.vo;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlElement;

@XmlRootElement(name="AjaxResult")
public class AjaxResult {

	private String errorCode;
	private String result;
	private List<ErrorMessage> errorMessages = null;
	
	public AjaxResult(){
		
	}
	
	public AjaxResult(String result){
		this(result, null);
	}
	
	public AjaxResult(String result, String errorCode){
		this.result = result;
		this.errorCode = errorCode;
	}

	@XmlElement(name = "errorItem")
	public List<ErrorMessage> getErrorMessages() {
		return errorMessages;
	}

	public void setErrorMessages(List<ErrorMessage> errorMessages) {
		this.errorMessages = errorMessages;
	}
	
	public String getErrorCode() {
		return errorCode;
	}
	
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	
	public void addErrorMessage(ErrorMessage errorMessage)
	{
		if(errorMessages == null)
		{
			errorMessages = new ArrayList<ErrorMessage>();
		}
		errorMessages.add(errorMessage);
	}
	

}
