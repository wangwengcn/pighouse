package com.pighouse.server.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home(ModelMap modelMap)
	{
		return "index";
	}
	
	@RequestMapping("/page/home")
	public String homePage(ModelMap modelMap)
	{
		return "page/home";
	}

}