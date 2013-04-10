<%@ page language="java" pageEncoding="gb2312"%>
<html>
  <head>
    <title>处理页面</title>
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
      String love=request.getParameter("love");
      if((!name.equals(""))&&(!pass.equals(""))){
        name=new String(name.getBytes("ISO-8859-1"));//编码转换,解决中文乱码。
        pass=new String(pass.getBytes("ISO-8859-1"));
        love=new String(love.getBytes("ISO-8859-1"));
    %>
    <center>
      <b><%=name %>  您好！ 您的注册信息如下：</b><br>
      用户名：<%=name %><br>
      密码:<%=pass %><br>
      爱好:<%=love %>
    </center>
    <%
      }else{
    %><center>对不起！你没有填写完整！</center><%
      }  
    %>
  </body>
</html>
