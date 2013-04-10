<%@page language="java" import="com.upload.upload_Bean" pageEncoding="utf-8" %>

<html>
  <head></head>
  
  <body>
<%
request.setCharacterEncoding("utf-8");

String filename=new String(request.getParameter("filename").getBytes("ISO8859_1"),"utf-8");
String filepath = request.getRealPath("/")+"/";        //获得要下载的文件的路径
   
upload_Bean ub=new upload_Bean();
ub.downFile(response,filename,filepath);

%>
  </body>
</html>

