package com.pighouse.server.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pighouse.server.constants.UserConstant;
import com.pighouse.server.domain.User;
import com.pighouse.server.domain.form.SignInCredentialVo;
import com.pighouse.server.domain.form.SignInForm;
import com.pighouse.server.domain.form.SignUpCredentialVo;
import com.pighouse.server.domain.vo.AjaxResult;
import com.pighouse.server.domain.vo.ErrorMessage;
import com.pighouse.server.service.UserService;
import com.pighouse.server.utils.ErrorUtil;
import com.pighouse.server.utils.SessionUtil;
import com.pighouse.server.utils.VOConverter;

@Controller
@RequestMapping("/user")
@SessionAttributes(UserConstant.SECURITY_CODE)
public class UserController {
	
	@Autowired
	private UserService userService;
	
	static
	{
		
	}
	
	@RequestMapping(value="/login" ,  method = RequestMethod.GET)
	public String login(HttpServletRequest request, ModelMap modelMap) throws Exception
	{	
		if(SessionUtil.getAttribute(UserConstant.LOGIN_USER, request) != null)
		{
			return "redirect:/"; 
		}
		return  "user/login";
	}
	
	@RequestMapping(value="/login",  method = RequestMethod.POST)
	public String login(@Valid SignInCredentialVo signInCredentialVo, BindingResult result, 
			HttpServletRequest request, ModelMap model) throws Exception
	{		
		if(!result.hasErrors())
		{
			// 验证码
			String code =  (String) model.get(UserConstant.SECURITY_CODE);
			if(!code.equalsIgnoreCase(signInCredentialVo.getSecurityCode()))
			{
				result.addError(new FieldError("signInCredentialVo", "securityCode", 
						UserConstant.SECURITYCODE_IS_NOT_CORRECT));
				return "user/login";
			}
			
			// 验证用户名
			User puser = userService.getUsersByEmail(signInCredentialVo.getSignInName());
			if(puser == null )
			{
				result.addError(new FieldError("signInCredentialVo", "signInName", 
						UserConstant.EMAIL_IS_NOT_EXIST));
			}
			
			// 验证密码
			else
			{
				if(signInCredentialVo.getSignInPassword().trim().equals(puser.getPassword()))
				{
					SessionUtil.addLogin(puser, request);
				}else{
					result.addError(new FieldError("signInCredentialVo", "signInPassword", 
							UserConstant.PASSWORD_IS_NOT_CORRECT));
				}
			}
		}
		if(result.hasErrors())
		{
			return "user/login";
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request, ModelMap modelMap) throws Exception
	{	
		SessionUtil.addLogout(request);
		return "redirect:/";
	}
	
	@RequestMapping(value="/register" ,  method = RequestMethod.GET)
	public String registerPage() throws Exception
	{	
		return "user/register";
	}
	
	@RequestMapping(value="/register" ,  method = RequestMethod.POST)
	public void register(@Valid SignUpCredentialVo signUpCredentialVo, BindingResult result, 
			HttpServletRequest request, ModelMap model) throws Exception
	{
		if(!result.hasErrors())
		{
			// 验证码
			String code =  (String) model.get(UserConstant.SECURITY_CODE);
			if(!signUpCredentialVo.getSecurityCode().equalsIgnoreCase(code))
			{
				result.addError(new FieldError("signUpCredentialVo", "securityCode", 
						UserConstant.SECURITYCODE_IS_NOT_CORRECT));
			}
			
			// 验证email
			User puser = userService.getUsersByEmail(signUpCredentialVo.getSignUpUserName());
			if(puser != null )
			{
				result.addError(new FieldError("signUpCredentialVo", "signUpUserName", 
						"该账号已存在"));
			}
			
			// 验证昵称
			puser = userService.getUsersByDisplayName(signUpCredentialVo.getDisplayName());
			if(puser != null )
			{
				result.addError(new FieldError("signUpCredentialVo", "displayName", 
						"该昵称已存在"));
			}
		}
		if(!result.hasErrors())
		{
			User user = userService.addUser(VOConverter.converterSignUpCredentialVo(signUpCredentialVo));
			SessionUtil.addLogin(user, request);
			model.addAttribute("regSuccessUser", user);
		}
	}
	
	@RequestMapping(value="/photo" ,  method = RequestMethod.GET)
	public void photo() throws Exception
	{	
		
	}
	
	@RequestMapping(value="/edit" ,  method = RequestMethod.GET)
	public void edit() throws Exception
	{	
		
	}
	
	/**
	 * Ajax登录
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/signIn",  method = RequestMethod.POST)
	public @ResponseBody User signIn(@Valid SignInForm form, BindingResult result, 
			HttpServletRequest request)
	{	
		User user = null;
		if(result.hasErrors())
		{
			user = new User();
			ErrorUtil.dealWithBindErrors(user, result);
			return user;
		}
		else 
		{
			// 验证email
			user = userService.getUsersByEmail(form.getEmail());
			if(user == null )
			{
				user = new User();
				ErrorMessage errorMessage = new ErrorMessage();
				errorMessage.setPropertyName("email");
				errorMessage.setErrorMessage(ErrorUtil.ACCOUNT_NOT_EXIST);
				user.addErrorMessage(errorMessage);
				return user;
			}
			else 
			{
				// 验证密码
				if(!form.getPassword().trim().equalsIgnoreCase(user.getPassword().trim()))
				{
					ErrorMessage errorMessage = new ErrorMessage();
					errorMessage.setPropertyName("password");
					errorMessage.setErrorMessage(ErrorUtil.PASSWORD_NOT_MATCH);
					user.addErrorMessage(errorMessage);
					return user;
				}
			}
		}
		// 用户名和密码匹配，正常登录
		SessionUtil.addLogin(user, request);
		return user;
	}
	
	/**
	 * 获取当前用户是否已经登录
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getloginFlag",  method = RequestMethod.POST)
	public @ResponseBody AjaxResult getloginFlag(HttpServletRequest request) throws Exception
	{	
		AjaxResult result = new AjaxResult();
		result.setResult(SessionUtil.getloginFlag(request).toString());
		return result;
	}
	
}
