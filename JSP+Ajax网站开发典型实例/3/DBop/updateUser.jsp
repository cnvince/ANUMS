<%@ page language="java" import="java.util.*,com.*" pageEncoding="utf-8"%>

<html>
  <body>
<%
UserDAO ud=new UserDAO();

if(ud.updateUser("李小晚","20",2))
	out.println("<center>更新成功，请查看数据库！<center>");
 %>

  </body>
</html>
