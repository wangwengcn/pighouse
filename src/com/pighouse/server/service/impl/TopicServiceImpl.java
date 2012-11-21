package com.pighouse.server.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.pighouse.server.dao.TopicDAO;
import com.pighouse.server.domain.TopicType;
import com.pighouse.server.domain.vo.TopicVO;
import com.pighouse.server.service.TopicService;

public class TopicServiceImpl implements TopicService{
	
	@Autowired
	private TopicDAO topicDAO;
	
	@Override
	public List<TopicVO> getTopicsByLastUpdateTime(Integer page) {
		return topicDAO.getTopicsByLastUpdateTime(page);
	}
	
	@Override
	public List<TopicType> getAllTopicTypes() 
	{
		return topicDAO.getAllTopicTypes();
	}

	@Override
	public List<TopicVO> getTopicsByCreateTime(Integer page) {
		return topicDAO.getTopicsByCreateTime(page);
	}
	
}
