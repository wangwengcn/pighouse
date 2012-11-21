package com.pighouse.server.domain.form;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

public class SignInCredentialVo {

	@NotBlank
	@Email
	private String signInName;
	@NotBlank
	private String signInPassword;
	@NotBlank
	private String securityCode;
	
	public String getSecurityCode() {
		return securityCode;
	}
	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}
	public String getSignInName() {
		return signInName;
	}
	public void setSignInName(String signInName) {
		this.signInName = signInName;
	}
	public String getSignInPassword() {
		return signInPassword;
	}
	public void setSignInPassword(String signInPassword) {
		this.signInPassword = signInPassword;
	}
}
