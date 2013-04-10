package com.upload; 

import java.io.*;   //引入输入输出流包
import javax.servlet.http.HttpServletRequest; //引入HttpServletRequest接口，主要处理HTTP格式的请求
import javax.servlet.ServletInputStream;      //引入ServletInputStream类，主要用来读取客户端提交请求的输入流
import javax.servlet.ServletException;        //处理异常

public class upload_Bean
{ 

	private static String newline = "\n";    //存储一个换行符
	private String uploadDirectory = ".";    //存储存放上传文件的文件夹路径
	private String ContentType = "";         //存储请求数据的MIME类型
	private String CharacterEncoding = "";   //存储字符编码
	private String filename="";              //存储上传文件的名字
	
	private String getFileName(String s)
	{ 
		int i = s.lastIndexOf("\\"); 
		if(i < 0 || i >= s.length() - 1){ 
		i = s.lastIndexOf("/"); 
		if(i < 0 || i >= s.length() - 1) 
		return s; 
		} 
		return s.substring(i + 1); 
	}
	
    public String getUpFileName()
    {
    	return this.filename;
    }
	
	public void setUploadDirectory(String s)
	{ 
		uploadDirectory = s; 
	} 
	
	public void setContentType(String s)
	{ 
		ContentType = s; 
		int j; 
		if((j = ContentType.indexOf("boundary=")) != -1)
		{ 
			ContentType = ContentType.substring(j + 9); 
			ContentType = "--" + ContentType; 
		} 
	} 
	
	public void setCharacterEncoding(String s)
	{ 
		CharacterEncoding = s; 
	} 
	
	public void uploadFile( HttpServletRequest req) throws ServletException, IOException
	{ 
		setCharacterEncoding(req.getCharacterEncoding()); 
		setContentType(req.getContentType()); 
		uploadFile(req.getInputStream()); 
	} 
	
	public void uploadFile( ServletInputStream servletinputstream) throws ServletException, IOException
	{ 
	
		String s5 = null; 
		 
		byte Linebyte[] = new byte[4096]; 
		byte outLinebyte[] = new byte[4096]; 
		int ai[] = new int[1]; 
		int ai1[] = new int[1]; 
		
		String line; 

		while((line = readLine(Linebyte, ai, servletinputstream, CharacterEncoding)) != null)  //此处调用readLine方法
		{ 
			int i = line.indexOf("filename="); 
			if(i >= 0)
			{ 
				line = line.substring(i + 10); 
				if((i = line.indexOf("\"")) > 0) 
				line = line.substring(0, i); 
				break; 
			} 
		} 
	
		filename = line; 
		
		if(filename != null && !filename.equals("\""))
		{ 
			filename = getFileName(filename); 
			
			String sContentType = readLine(Linebyte, ai, servletinputstream, CharacterEncoding); 
			if(sContentType.indexOf("Content-Type") >= 0) 
			readLine(Linebyte, ai, servletinputstream, CharacterEncoding); 
			
		
			File file = new File(uploadDirectory, filename);   //应用文件类
	
			FileOutputStream fileoutputstream = new FileOutputStream(file); //应用文件输出流对象
			
			while((sContentType = readLine(Linebyte, ai, servletinputstream, CharacterEncoding)) != null)
			{ 
				if(sContentType.indexOf(ContentType) == 0 && Linebyte[0] == 45) 
				break; 
			
				if(s5 != null)
				{ 
		
					fileoutputstream.write(outLinebyte, 0, ai1[0]); 
					fileoutputstream.flush(); 
				} 
				s5 = readLine(outLinebyte, ai1, servletinputstream, CharacterEncoding); 
				if(s5 == null || s5.indexOf(ContentType) == 0 && outLinebyte[0] == 45) 
				break; 
				fileoutputstream.write(Linebyte, 0, ai[0]); 
				fileoutputstream.flush(); 
			} 
			
			byte byte0; 
			if(newline.length() == 1) 
			byte0 = 2; 
			else 
			byte0 = 1; 
			if(s5 != null && outLinebyte[0] != 45 && ai1[0] > newline.length() * byte0) 
			fileoutputstream.write(outLinebyte, 0, ai1[0] - newline.length() * byte0); 
			if(sContentType != null && Linebyte[0] != 45 && ai[0] > newline.length() * byte0) 
			fileoutputstream.write(Linebyte, 0, ai[0] - newline.length() * byte0); 
			
			fileoutputstream.close(); 
		} 
	} 
	
	private String readLine(byte Linebyte[], int ai[],ServletInputStream servletinputstream, String CharacterEncoding)
	{ 
	
		try
		{ 

			ai[0] = servletinputstream.readLine(Linebyte, 0, Linebyte.length); 
			if(ai[0] == -1) 
			return null; 
		}
		catch(IOException _ex)
		{ 
			return null; 
		} 
		
		try
		{ 
			if(CharacterEncoding == null)
			{ 
			//用缺省的编码方式把给定的byte数组转换为字符串 
			//String(byte[] bytes, int offset, int length) 
			return new String(Linebyte, 0, ai[0]); 
			}
			else
			{ 
				//用给定的编码方式把给定的byte数组转换为字符串 
				//String(byte[] bytes, int offset, int length, String enc) 
				return new String(Linebyte, 0, ai[0], CharacterEncoding); 
			} 
		}
		catch(Exception _ex)
		{ 
			return null; 
		} 
	} 

	
	public void downFile( javax.servlet.http.HttpServletResponse res,String filename,String filepath) throws ServletException, IOException
	{
		res.setContentType("APPLICATION/OCTET-STREAM"); 
		res.setHeader("Content-Disposition","attachment; filename=\"" + java.net.URLEncoder.encode(filename,"UTF-8") + "\""); 

       //		应用文件输入流对象
		java.io.FileInputStream fileInputStream = new java.io.FileInputStream(filepath+filename); 
       //		应用文件输出流对象		
		java.io.FileOutputStream fileOutputStream =new java.io.FileOutputStream(filepath+filename);

		
		int i; 
		while ((i=fileInputStream.read()) != -1) 
		{ 
			fileOutputStream.write(i);
		} 
	}


} 



