<%@page language="java" import="com.upload.upload_Bean" pageEncoding="utf-8" %> 

<%
 String Dir = "C:/Program Files/Apache Software Foundation/Tomcat 6.0/webapps/uploadFile";
 
 com.upload.upload_Bean upload_bean = new com.upload.upload_Bean(); 
 upload_bean.setUploadDirectory(Dir); 
 upload_bean.uploadFile(request); 
 out.println("文件上传成功");

 %>

 <a href="down.jsp?filename=<%=upload_bean.getUpFileName() %>">下载文件</a>