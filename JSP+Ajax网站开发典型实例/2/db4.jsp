<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>创建数据库、表和字段</title>
  </head>
<style type="text/css">
<!--
body {
	background-image: url(images/img.jpg);
}
-->
</style>
  <body><center>
  <% 
  String sql=null;
  String url=null;
  Statement st=null;
  try{
    out.print("<b>创建开始...</b><br>");
    sql="CREATE DATABASE test";
    url="jdbc:MySQL://localhost:3306?user=root&password=tmq&characterEncoding=gb2312";
    st=getStatement(url);
    st.execute(sql);
    out.print("<b>数据库test创建成功...</b><br>");
    sql="CREATE TABLE `table` (`field1` int(11),`field2` char(20),`field3` char(10))";
    url="jdbc:MySQL://localhost:3306/test?user=root&password=tmq&characterEncoding=gb2312";
    st=getStatement(url);
    st.execute(sql);
    out.print("<b>表table创建成功...</b><br>");
    out.print("<b>创建结束...</b><br>");
    }catch(Exception e){
      out.print("<b>创建失败</b>原因："+e.toString());
    }
  %>
   </center>
  </body>
</html>
<%!
//连接数据库，取得Statement对象
public Statement getStatement(String url){
  try{
     Class.forName("com.mysql.jdbc.Driver");
	 
	 Connection con=DriverManager.getConnection(url);
	 return con.createStatement();
  }catch(Exception e){return null;}
}
%>

