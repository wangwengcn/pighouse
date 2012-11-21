package com.pighouse.server.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;
import javax.imageio.ImageIO;

public class SecurityCode {
	
	// 0-9,a-z,A-Z
	private static char[] mapTable = new char[10];
	private static Random random = new Random();
	private static Color[] colors = {Color.BLACK, Color.BLUE, Color.CYAN, Color.DARK_GRAY,
		Color.GRAY, Color.GREEN, Color.LIGHT_GRAY, Color.MAGENTA, Color.ORANGE, Color.PINK, Color.RED};
	private static Font font = new Font("Atlantic Inline",Font.PLAIN,18);
	
	static{
		int num = 0;
		// 0-9
		for(int i=48;i<=57;i++)
		{
			mapTable[num++] = (char)i;
		}
//		// A-Z
//		for(int i=65;i<=90;i++)
//		{
//			mapTable[num++] = (char)i;
//		}
//		// a-z
//		for(int i=97;i<=122;i++)
//		{
//			mapTable[num++] = (char)i;
//		}
	}
	
	  /**
	  * 功能:生成彩色验证码图片
	  */
	public static String getCertPic(int width, int height, int positionY, int codeNumber, OutputStream os) {
		if(width <= 0) width = 60;
		if(height <= 0) height = 20;
		if(codeNumber <= 0) codeNumber = 4;
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		// 获取图形上下文  
		Graphics g = image.getGraphics();
		// 设定背景色  
		g.setColor(new Color(0xe8edf1));
		g.fillRect(0, 0, width, height);
		// 画边框 
		g.setColor(Color.black);
		g.drawRect(0,0,width-1,height-1);
		// 取随机产生的认证码
		char[] codes = new char[codeNumber];
		// 4代表4位验证码,如果要生成更多位的认证码,则加大数值
		for(int i=0; i<codes.length; ++i)
		{
			codes[i] = mapTable[random.nextInt(mapTable.length)];
		}
		// 将认证码显示到图像中,如果要生成更多位的认证码,增加drawString语句
		g.setFont(font);
		int startX = 5;
		for(int i =0; i<codes.length; i++)
		{
			g.setColor(colors[random.nextInt(colors.length)]);
			g.drawString(codes[i]+"",
					startX+(i*13),
					positionY);
		}
		// 随机产生10个干扰点
		g.setColor(colors[random.nextInt(colors.length)]);
		for (int i=0;i<20;i++)
		{
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			g.drawOval(x,y,1,1);
		}
//		// 随机生成10条干扰线
//		for (int i=0;i<10;i++)
//		{
//		  int x = random.nextInt(width);
//		  int y = random.nextInt(height);
//		  int xl = random.nextInt(12);
//		  int yl = random.nextInt(12);
//		  g.drawLine(x,y,x+xl,y+yl);
//		}
		// 释放图形上下文
		g.dispose();   
		try {
			// 输出图像到页面  
			ImageIO.write(image, "JPEG", os);
		} 
		catch (IOException e) 
		{
			return "";
		}   
		return new String(codes);
	}
	
	public static String getCertPic(OutputStream os) {
		return getCertPic(60, 20, 16, 4, os);
	}
	
	public static String getCertPic(OutputStream os, int width, int height, int y) {
		return getCertPic(width, height,y, 4, os);
	}
	
	public static void main(String[] args) throws FileNotFoundException
	{
		FileOutputStream fo = new FileOutputStream("C:/bbb.jpeg");
		System.out.println(SecurityCode.getCertPic(fo));
	}

}
