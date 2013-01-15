package com.pighouse.server.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.pighouse.server.dao.TopicDAO;
import com.pighouse.server.domain.Topic;
import com.pighouse.server.domain.TopicPicture;
import com.pighouse.server.domain.TopicType;
import com.pighouse.server.domain.converter.TopicConverter;
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

	@Override
	public TopicVO addTopic(Topic topic) {
		return TopicConverter.converter(topicDAO.addTopic(topic));
	}

	@Override
	public Topic updateTopic(Topic topic) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TopicPicture getPictureById(int id) {
		return topicDAO.getPictureById(id);
	}
	
}
