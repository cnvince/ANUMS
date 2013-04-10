<%@ page language="java" import="java.util.*,com.*" pageEncoding="utf-8"%>

<html>
  <body>
<%
UserDAO ud=new UserDAO();
String name="李小晚";
String age="22";
if(ud.addUser(name,age))
	out.println("<center>添加成功，请查看数据库！</center>");
%>
  </body>
</html>
