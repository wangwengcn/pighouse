package com.pighouse.server.domain.vo;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="ErrorMessage")
public class ErrorMessage {

	private String propertyName;
	private String errorMessage;
	
	public String getPropertyName() {
		return propertyName;
	}
	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
}
