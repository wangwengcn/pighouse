package com.pighouse.server.domain.converter;

import java.util.ArrayList;
import java.util.List;

import com.pighouse.server.domain.Comment;
import com.pighouse.server.domain.Topic;
import com.pighouse.server.domain.vo.TopicVO;

public final class TopicConverter{
	
	private static int MAX_NUMBER_COMMMENTS_SHOW_IN_PAGE = 3;
	
	public static TopicVO converter(Topic t)
	{
		ArrayList<Comment> list = new ArrayList<Comment>();
		int i = 0;
		for(Comment comment : t.getComments())
		{
			list.add(comment);
			i++;
			if(i == MAX_NUMBER_COMMMENTS_SHOW_IN_PAGE)
			{
				break;
			}
		}
		
		TopicVO topic = new TopicVO();
		topic.setTitle(t.getTitle())
			 .setLastUpdateTime(t.getLastUpdateTime())
			 .setCreateUser(t.getCreateUser())
			 .setCreateTime(t.getCreateTime());
		topic.setComments(list);
		topic.setCommentNumber(i);
		return topic;
	}
	
	public static List<TopicVO> converter(List<Topic> list)
	{
		List<TopicVO> voList = new ArrayList<TopicVO>();
		for(Topic t : list)
		{
			voList.add(converter(t));
		}
		return voList;
	}
}
