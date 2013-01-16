package com.pighouse.server.domain.converter;

import java.util.ArrayList;
import java.util.List;

import com.pighouse.server.domain.Comment;
import com.pighouse.server.domain.vo.CommentVO;

public class CommentConverter {
	
	public static CommentVO converter(Comment c)
	{
		CommentVO vo = new CommentVO();
		vo.setId(c.getId().toString());
		vo.setContent(c.getContent());
		vo.setCreateTime(c.getCreateTime());
		vo.setUserId(c.getCreateUser().getUserId().toString());
		vo.setUserName(c.getCreateUser().getDisplayName());
		return vo;
	}
	
	public static List<CommentVO> converter(List<Comment> list)
	{
		List<CommentVO> voList = new ArrayList<CommentVO>();
		for(Comment c : list)
		{
			voList.add(converter(c));
		}
		return voList;
	}
}
