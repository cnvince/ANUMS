<%@ page language="java" import="java.util.*,com.*" pageEncoding="utf-8"%>

<html>
  <body>
<%
UserDAO ud=new UserDAO();

if(ud.delUser("2"))
	out.println("<center>删除成功,请查看数据库！</center>");
 %>
  </body>
</html>
