package com.pighouse.server.springmvc.controller;

import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.pighouse.server.constants.ModelConstant;
import com.pighouse.server.constants.UserConstant;
import com.pighouse.server.domain.vo.AjaxResult;
import com.pighouse.server.utils.SecurityCode;

@Controller
@RequestMapping(value="/securityCode")
@SessionAttributes(UserConstant.SECURITY_CODE)
public class SecurityCodeController {

	@RequestMapping(value="/get")
	public void getCode(HttpServletRequest request,  HttpServletResponse response, ModelMap modelMap) throws Exception
	{	
		response.setContentType("image/jpeg");
		OutputStream os = response.getOutputStream();
		String code = SecurityCode.getCertPic(os, 60, 30, 21);
		modelMap.addAttribute(UserConstant.SECURITY_CODE, code);
		os.flush();
		os.close();
	}
	
	@RequestMapping(value="/validate")
	public @ResponseBody AjaxResult validateCode(ModelMap model, SessionStatus status, String securityCode) throws Exception
	{	
		AjaxResult  result = new AjaxResult(ModelConstant.AJAX_FALSE);
		String code =  (String) model.get(UserConstant.SECURITY_CODE);
		if(null == code || null == securityCode)
		{
			return result;
		}
		if(code.equalsIgnoreCase(securityCode.trim()))
		{
			result = new AjaxResult(ModelConstant.AJAX_SUCCESS);
		}		
		return result;
	}

}
