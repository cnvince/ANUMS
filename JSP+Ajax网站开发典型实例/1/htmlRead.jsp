<%@ page language="java" import="java.io.*" pageEncoding="gb2312"%>
<html>
  <head>
     <title>JSP读取TXT格式文档</title>
     <style type="text/css">
      <!--
       body {
	        background-image: url(images/img.jpg);
       }
      -->
    </style>
  </head>
  <%
       String path="C:\\Tomcat\\webapps\\JSP_Ajax";//TOMCAT站点工作路径。
       File file=new File(path,"MyHtml.html");
       FileReader fr=new FileReader(file);//字符输入流。
       BufferedReader br=new BufferedReader(fr); //使文件可以按行读取并具有缓冲功能。
       StringBuffer strB=new StringBuffer();//strB用来存储jsp.txt文件里的内容。
       String str=br.readLine();//读取文件的一行。
       while(str!=null){
         strB.append(str).append("<br>");//将读取的内容放入strB
         str=br.readLine();
       }
       br.close();//关闭输入流。
   %>
  <body>
     <%=strB %>
  </body>
</html>
