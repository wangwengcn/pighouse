package com.pighouse.server.domain.form;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import com.pighouse.server.springmvc.validate.FieldEqual;

@FieldEqual(firstField = "signUpPassword", secondField = "reSignUpPassword", message="两次密码输入不一致")
public class SignUpCredentialVo {

	@NotBlank
	@Email
	private String signUpUserName;
	@NotBlank
	private String displayName;
	@Length(min=6, max=12)
	private String signUpPassword;
	private String reSignUpPassword;
	@NotBlank
	private String securityCode;
	
	public String getSecurityCode() {
		return securityCode;
	}
	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}
	public String getSignUpUserName() {
		return signUpUserName;
	}
	public void setSignUpUserName(String signUpUserName) {
		this.signUpUserName = signUpUserName;
	}
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	public String getSignUpPassword() {
		return signUpPassword;
	}
	public void setSignUpPassword(String signUpPassword) {
		this.signUpPassword = signUpPassword;
	}
	public String getReSignUpPassword() {
		return reSignUpPassword;
	}
	public void setReSignUpPassword(String reSignUpPassword) {
		this.reSignUpPassword = reSignUpPassword;
	}
	
}
