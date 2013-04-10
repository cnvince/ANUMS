<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>MySQL数据库连接</title>
  </head>
<style type="text/css">
<!--
body {
	background-image: url(images/img.jpg);
}
-->
</style>
  <body>
<%
  try{
     Class.forName("com.mysql.jdbc.Driver");
	 String url="jdbc:MySQL://localhost:3306/test?user=root&password=tmq";
	 Connection conn=DriverManager.getConnection(url);
         out.print("<br><center>恭喜你！Mysql数据库连接成功！</center>");
         conn.close();    //关闭连接对象
    }catch(Exception e){
        out.print("数据库连接错误！,错误信息如下：<br>");
        out.print(e.getMessage());
    }
%>
  </body>
</html>