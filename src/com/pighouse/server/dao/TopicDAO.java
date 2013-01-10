package com.pighouse.server.dao;

import java.util.List;

import com.pighouse.server.domain.Topic;
import com.pighouse.server.domain.TopicPicture;
import com.pighouse.server.domain.TopicType;
import com.pighouse.server.domain.vo.TopicVO;

public interface TopicDAO {

	public List<TopicVO> getTopicsByLastUpdateTime(Integer pageNumber);
	public List<TopicVO> getTopicsByCreateTime(Integer pageNumber);
	public List<TopicType> getAllTopicTypes();
	public Topic addTopic(Topic topic);
	public Topic updateTopic(Topic topic);
	public TopicPicture getPictureById(int id);
}
