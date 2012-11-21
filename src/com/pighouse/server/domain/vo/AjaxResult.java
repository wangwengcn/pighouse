package com.pighouse.server.domain.vo;

public class AjaxResult {

	private String status;
	private String errorCode;
	private Object result;
	
	public AjaxResult(){
		
	}
	
	public AjaxResult(String status){
		this.status = status;
	}
	
	public AjaxResult(String status, String errorCode){
		this.status = status;
		this.errorCode = errorCode;
	}
	
	public AjaxResult(String status, Object result){
		this.status = status;
		this.result = result;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
	public Object getResult() {
		return result;
	}
	public void setResult(Object result) {
		this.result = result;
	}
	
	

}
