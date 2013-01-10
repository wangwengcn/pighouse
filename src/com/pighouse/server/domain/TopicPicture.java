package com.pighouse.server.domain;

import java.sql.Blob;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@XmlRootElement(name="TopicPicture")
public class TopicPicture {

	private Long id;
	private String fileName;
	private Blob content;
	private Long size;
	private Topic topic;
	private int width;
	private int height;
	
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	@XmlTransient
	public Topic getTopic() {
		return topic;
	}
	public void setTopic(Topic topic) {
		this.topic = topic;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@XmlTransient
	public Blob getContent() {
		return content;
	}
	public void setContent(Blob content) {
		this.content = content;
	}
	public Long getSize() {
		return size;
	}
	public void setSize(Long size) {
		this.size = size;
	}
}
