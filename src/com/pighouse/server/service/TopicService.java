package com.pighouse.server.service;

import java.util.List;

import com.pighouse.server.domain.Topic;
import com.pighouse.server.domain.TopicPicture;
import com.pighouse.server.domain.TopicType;
import com.pighouse.server.domain.vo.TopicVO;

public interface TopicService {

	public List<TopicVO> getTopicsByLastUpdateTime(Integer page);
	public List<TopicVO> getTopicsByCreateTime(Integer page);
	public List<TopicType> getAllTopicTypes();
	public TopicVO addTopic(Topic topic);
	public Topic updateTopic(Topic topic);
	public TopicPicture getPictureById(int id);
}
