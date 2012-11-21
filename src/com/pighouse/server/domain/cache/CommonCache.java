package com.pighouse.server.domain.cache;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.map.HashedMap;

import com.pighouse.server.constants.CacheModel;
import com.pighouse.server.domain.TopicType;
import com.pighouse.server.service.TopicService;
import com.pighouse.server.utils.SpringHelper;

public class CommonCache {

	private static HashedMap caches = new HashedMap();
	
	@SuppressWarnings("unchecked")
	public static List<TopicType> getAllTopicTypes() 
	{
		if(caches.get(CacheModel.TOPIC_TYPE) == null)
		{
			synchronized (CacheModel.TOPIC_TYPE)
			{
				if(caches.get(CacheModel.TOPIC_TYPE) == null)
				{
					TopicService service = (TopicService)SpringHelper.getBean("topicService");
					List<TopicType> list = service.getAllTopicTypes();
					for(TopicType t:list)
					{
						System.out.println(t.getName());
					}
					caches.put(CacheModel.TOPIC_TYPE, list);
					return list;
				}
			}
		}
		return (ArrayList<TopicType>) caches.get(CacheModel.TOPIC_TYPE);
	}
}
