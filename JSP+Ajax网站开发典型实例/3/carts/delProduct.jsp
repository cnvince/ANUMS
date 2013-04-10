<%@ page language="java" import="java.util.*,com.*" pageEncoding="utf-8"%>

<html>
  <head></head> 
  <body>
  <center>
<%
String id=request.getParameter("id");
ShoppingDAO sd=new ShoppingDAO();
if(sd.delShopping(id))
	out.println("删除成功!");
else
	out.println("删除失败!");
 %>
 <a href="index.jsp" target="_self">返回</a>
  </body>
  </center>
</html>
