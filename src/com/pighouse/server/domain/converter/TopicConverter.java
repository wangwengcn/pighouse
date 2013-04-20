package com.pighouse.server.domain.converter;

import java.util.ArrayList;
import java.util.List;

import com.pighouse.server.constants.ModelConstant;
import com.pighouse.server.domain.Comment;
import com.pighouse.server.domain.Topic;
import com.pighouse.server.domain.vo.CommentVO;
import com.pighouse.server.domain.vo.TopicVO;

public final class TopicConverter{
	
	public static TopicVO converter(Topic t)
	{
		TopicVO topic = new TopicVO();
		ArrayList<CommentVO> list = new ArrayList<CommentVO>();
		if(t.getComments() != null)
		{
			for(Comment comment : t.getComments())
			{
				list.add(CommentConverter.converter(comment));
				if(list.size() == ModelConstant.MAX_NUMBER_COMMMENTS_SHOW_IN_PAGE)
				{
					break;
				}
			}
			topic.setCommentNumber(t.getComments().size());
		}
		topic.setId(t.getId().toString());
		topic.setTitle(t.getTitle())
			 .setLastUpdateTime(t.getLastUpdateTime())
			 .setCreateUser(t.getCreateUser())
			 .setCreateTime(t.getCreateTime());
		topic.setComments(list);
		topic.setPictures(t.getPictures());
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
