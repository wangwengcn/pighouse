package com.pighouse.server.domain.vo;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import com.pighouse.server.domain.Comment;

@XmlRootElement(name="topics")
public class TopicVOList {

	List<TopicVO> list = null;

	@XmlElement(name="topic")
	public List<TopicVO> getList() {
		return list;
	}

	public void setList(List<TopicVO> list) {
		this.list = list;
	}
}
