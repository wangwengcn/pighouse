package com.pighouse.server.springmvc.controller;

import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping(value="/photo")
@Controller
public class PhotoUploadController {
	
	@RequestMapping(value="/upload",  method = RequestMethod.POST)
	public @ResponseBody String upload(@RequestParam MultipartFile imageFile, HttpServletRequest request,
			ModelMap model) throws Exception {
		String orgName = imageFile.getOriginalFilename();
		String newName = new StringBuilder()
				.append(System.currentTimeMillis())
				.append(orgName.substring(orgName.lastIndexOf('.')))
				.toString();
		
		File file = new File("tempfile"+"/"+newName);
		if(!file.getParentFile().exists())
		{
			file.getParentFile().mkdir();
		}
		imageFile.transferTo(file);
		String fileName = file.getName();
		fileName = fileName.substring(0, fileName.lastIndexOf('.'));
		System.out.println(file.getAbsolutePath());
		request.getSession().setAttribute("photoName" ,file.getAbsolutePath());
		return fileName;
	}
	
	@RequestMapping(value="/get")
	public void get(HttpSession session, ModelMap model, HttpServletResponse response) throws Exception
	{
		String fileUrl = (String) session.getAttribute("photoName");
		if(fileUrl == null)
		{
			throw new Exception("您上传的图片无法找到");
		}
		File file = new File(fileUrl);
		FileInputStream fis = new FileInputStream(file);
		byte[] data = new byte[fis.available()];
		fis.read(data);
		fis.close();
		response.getOutputStream().write(data);
	}
}
