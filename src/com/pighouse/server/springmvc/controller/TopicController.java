package com.pighouse.server.springmvc.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.pighouse.server.constants.UserConstant;
import com.pighouse.server.domain.Topic;
import com.pighouse.server.domain.TopicPicture;
import com.pighouse.server.domain.vo.AjaxResult;
import com.pighouse.server.domain.vo.TopicVO;
import com.pighouse.server.domain.vo.TopicVOList;
import com.pighouse.server.service.TopicService;
import com.pighouse.server.utils.ErrorUtil;
import com.pighouse.server.utils.SessionUtil;

@Controller
@RequestMapping("/topic")
public class TopicController {
	
	@Autowired
	private TopicService topicService;
	
	@RequestMapping(value="/add" ,  method = RequestMethod.GET)
	public String addPage(HttpServletRequest request) throws Exception
	{
		if(SessionUtil.getAttribute(UserConstant.LOGIN_USER, request) == null)
		{
			return  "user/login";
		}
		return "topic/add";
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/add" ,  method = RequestMethod.POST)
	public @ResponseBody TopicVO add(@Valid Topic topic, BindingResult result, MultipartFile picture, HttpServletRequest request) throws Exception
	{
		TopicVO topicvo = new TopicVO();
		if(SessionUtil.getAttribute(UserConstant.LOGIN_USER, request) == null)
		{
			topicvo.addErrorMessage(ErrorUtil.createErrorMessage("title", "请登录后再发分享图片"));
			return topicvo;
		}
		if(null == picture)
		{
			topicvo.addErrorMessage(ErrorUtil.createErrorMessage("picture", "请选择合法的图片格式"));
			return topicvo;
		}
		if(result.hasErrors())
		{
			ErrorUtil.dealWithBindErrors(topicvo, result);
			return topicvo;
		}
		else 
		{
			if(picture.getSize() > 3*1024*1024)
			{
				topicvo.addErrorMessage(ErrorUtil.createErrorMessage("picture", "请确保文件小于3M"));
				return topicvo;
			}
			BufferedImage img = ImageIO.read(new ByteArrayInputStream(picture.getBytes()));
			TopicPicture topicPicture = new TopicPicture();
			topicPicture.setSize(picture.getSize());
			topicPicture.setFileName(picture.getOriginalFilename());
			topicPicture.setContent(Hibernate.createBlob(picture.getBytes()));
			topicPicture.setHeight(img.getHeight());
			topicPicture.setWidth(img.getWidth());
			Set<TopicPicture> set = new HashSet<TopicPicture>();
			set.add(topicPicture);
			
			Date currDate = new Date();
			topic.setCreateTime(currDate);
			topic.setLastUpdateTime(currDate);
			topic.setPictures(set);
			topic.setCreateUser(SessionUtil.getloginUser(request));
			
			topicPicture.setTopic(topic);
			topicvo = topicService.addTopic(topic);
		}
		return topicvo;
	}

	@RequestMapping(value="/getTopics" ,  method = RequestMethod.POST)
	public @ResponseBody TopicVOList getTopics(Integer page, HttpServletRequest request, ModelMap modelMap) throws Exception
	{
		page = page == null? 1 : page;
		List<TopicVO> list = topicService.getTopicsByLastUpdateTime(page);
		TopicVOList result = new TopicVOList();
		result.setList(list);
		return result;
	}
	
	@RequestMapping(value="/getPicture/{pictureId}" ,  method = RequestMethod.GET)
	public void getPicture(@PathVariable String pictureId, HttpServletResponse response, ModelMap modelMap) throws Exception
	{
		response.setContentType("image/jpg");
		try{
			int id = Integer.valueOf(pictureId);
			TopicPicture picture = topicService.getPictureById(id);
			if(picture != null)
			{
				Blob content = picture.getContent();
				OutputStream output = response.getOutputStream();
				response.addHeader("Content-Disposition", 
						"attachment;filename=\""+ picture.getFileName() + "\"");
				output.write(content.getBytes(1, (int) content.length()));
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}
}
