<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>使用request处理页面</title>
  </head>
<style type="text/css">
<!--
body {
	background-image: url(images/img.jpg);
}
-->
</style>
  <body><br>
    <%
      String name=request.getParameter("name");
      String pass=request.getParameter("pass");
      if(!(name.equals("")||pass.equals(""))){
         name=new String(name.getBytes("ISO-8859-1"));//处理中文乱码
    %>
    <center>
      <b>欢迎<%=name %>的到来！</b><br>
      您登录的时间为：<%=new Date().toLocaleString() %>
    </center>
    <%
      }else{
    %><center>对不起！你没有登录成功！</center><%
      }  
    %>
  </body>
</html>
