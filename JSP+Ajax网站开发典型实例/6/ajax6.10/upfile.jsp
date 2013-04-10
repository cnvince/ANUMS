<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.io.*"%> 
<html>
<body background="bg.gif">
<% 
   request.setCharacterEncoding("utf-8");
   int MAX_SIZE = 102400 * 102400;    //设置上传文件的最大值
   String rootPath;
   DataInputStream in = null;
   FileOutputStream fileOut = null; 
   String remoteAddr = request.getRemoteAddr();
   String serverName = request.getServerName(); 
   String realPath = request.getRealPath(serverName);  
   realPath = realPath.substring(0,realPath.lastIndexOf("\\")); 
   rootPath = realPath + "\\upload\\";
   String contentType = request.getContentType();         //取得客户端上传的数据类型 
try{ 
	   if(contentType.indexOf("multipart/form-data") >= 0){ 
	   in = new DataInputStream(request.getInputStream());               //读入上传的数据
	   int formDataLength = request.getContentLength(); 
	   if(formDataLength > MAX_SIZE)
	   { 
		  out.println("<P>上传的文件字节数不可以超过" + MAX_SIZE + "</p>"); 
		   return; 
	   } 
	   byte dataBytes[] = new byte[formDataLength];        //保存上传文件的数据 
	   int byteRead = 0; 
	   int totalBytesRead = 0; 
	   while(totalBytesRead < formDataLength)
	   {  //上传的数据保存在byte数组
			 byteRead = in.read(dataBytes,totalBytesRead,formDataLength); 
			totalBytesRead += byteRead; 
		} 
	   String file = new String(dataBytes);  //根据byte数组创建字符串 
	   String saveFile = file.substring(file.indexOf("filename=\"") + 10);   //取得上传的数据的文件名
	   saveFile = saveFile.substring(0,saveFile.indexOf("\n")); 
	   saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\"")); 
	   int lastIndex = contentType.lastIndexOf("="); 
	   String boundary = contentType.substring(lastIndex + 1,contentType.length());
	   String fileName = rootPath + saveFile; 
	   int pos; 
	   pos = file.indexOf("filename=\""); 
	   pos = file.indexOf("\n",pos) + 1; 
	   pos = file.indexOf("\n",pos) + 1; 
	   pos = file.indexOf("\n",pos) + 1; 
	   int boundaryLocation = file.indexOf(boundary,pos) - 4; 
	   int startPos = ((file.substring(0,pos)).getBytes()).length;//取得文件数据的开始的位置 
	   int endPos = ((file.substring(0,boundaryLocation)).getBytes()).length;
	   File checkFile = new File(fileName);
	   if(checkFile.exists())
	   { 
			 out.println("<p>文件已经存在,请重新上传</p>");
			 return ; 
		} 
	   File fileDir = new File(rootPath); 
	   if(!fileDir.exists())
	   { 
		  fileDir.mkdirs(); 
		} 
	   fileOut = new FileOutputStream(fileName);
	   fileOut.write(dataBytes,startPos,(endPos - startPos));
	   fileOut.close(); 
		out.println("<P><center><font color=red size=5>文件上传成功！</font></center></p>"); 
	   }
	   else
	   { 
	   String content = request.getContentType(); 
	   out.println("<p>上传的数据类型不是是multipart/form-data</p>"); 
		} 
   }
   catch(Exception ex)
   { 
         throw new ServletException(ex.getMessage()); 
   } 
%> 
</body> 
</html> 
