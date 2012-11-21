package com.pighouse.server.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class SpringHelper implements ApplicationContextAware{
	
	private static ApplicationContext applicationContext;
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext)throws BeansException 
	{
		SpringHelper.applicationContext = applicationContext;
	}
	
	public static Object getBean(String beanName)
	{
		return applicationContext.getBean(beanName);
	}
}
