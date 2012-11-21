package com.pighouse.server.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pighouse.server.domain.vo.TopicVO;
import com.pighouse.server.service.TopicService;

@Controller
@RequestMapping("/topic")
public class TopicController {
	
	@Autowired
	private TopicService topicService;
	
	@RequestMapping(value="/add" ,  method = RequestMethod.GET)
	public String add(HttpServletRequest request) throws Exception
	{
//		if(SessionUtil.getAttribute(UserConstant.LOGIN_USER, request) == null)
//		{
//			return  "user/login";
//		}
		return "topic/add";
	}

	@RequestMapping(value="/getTopics" ,  method = RequestMethod.GET)
	public @ResponseBody List<TopicVO> getTopics(Integer page, HttpServletRequest request, ModelMap modelMap) throws Exception
	{
		page = page == null? 1 : page;
		List<TopicVO> list = topicService.getTopicsByLastUpdateTime(page);
		return list;
	}
}
