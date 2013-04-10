<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<html>
  <head>
    <title>sqlserver数据库连接</title>
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
      Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver").newInstance();
      String　url="jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=test";
      //test　为你的数据库的
      String　name="sa";//用户名
      String　pass="admin";//密码
      Connection　conn=　DriverManager.getConnection(url,name,pass);
      out.print("<br><center>恭喜你！SQL Server数据库连接成功！</center>");
      conn.close(); //关闭连接对象
    }catch(Exception e){
      out.print("数据库连接错误！,错误信息如下：<br>");
      out.print(e.getMessage());
   }
%>
</body>
</html> 