package com.upload; 

import java.io.*;   //���������������
import javax.servlet.http.HttpServletRequest; //����HttpServletRequest�ӿڣ���Ҫ����HTTP��ʽ������
import javax.servlet.ServletInputStream;      //����ServletInputStream�࣬��Ҫ������ȡ�ͻ����ύ�����������
import javax.servlet.ServletException;        //�����쳣

public class upload_Bean
{ 

	private static String newline = "\n";    //�洢һ�����з�
	private String uploadDirectory = ".";    //�洢����ϴ��ļ����ļ���·��
	private String ContentType = "";         //�洢�������ݵ�MIME����
	private String CharacterEncoding = "";   //�洢�ַ�����
	private String filename="";              //�洢�ϴ��ļ�������
	
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

		while((line = readLine(Linebyte, ai, servletinputstream, CharacterEncoding)) != null)  //�˴�����readLine����
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
			
		
			File file = new File(uploadDirectory, filename);   //Ӧ���ļ���
	
			FileOutputStream fileoutputstream = new FileOutputStream(file); //Ӧ���ļ����������
			
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
			//��ȱʡ�ı��뷽ʽ�Ѹ�����byte����ת��Ϊ�ַ��� 
			//String(byte[] bytes, int offset, int length) 
			return new String(Linebyte, 0, ai[0]); 
			}
			else
			{ 
				//�ø����ı��뷽ʽ�Ѹ�����byte����ת��Ϊ�ַ��� 
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

       //		Ӧ���ļ�����������
		java.io.FileInputStream fileInputStream = new java.io.FileInputStream(filepath+filename); 
       //		Ӧ���ļ����������		
		java.io.FileOutputStream fileOutputStream =new java.io.FileOutputStream(filepath+filename);

		
		int i; 
		while ((i=fileInputStream.read()) != -1) 
		{ 
			fileOutputStream.write(i);
		} 
	}


} 



