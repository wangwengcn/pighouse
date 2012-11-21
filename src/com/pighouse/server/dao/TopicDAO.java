package com.pighouse.server.dao;

import java.util.List;

import com.pighouse.server.domain.TopicType;
import com.pighouse.server.domain.vo.TopicVO;

public interface TopicDAO {

	public List<TopicVO> getTopicsByLastUpdateTime(Integer pageNumber);
	public List<TopicVO> getTopicsByCreateTime(Integer pageNumber);
	
	public List<TopicType> getAllTopicTypes();
}
