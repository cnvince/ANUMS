<%@ page language="java" import="java.util.*,com.*" pageEncoding="utf-8"%>

<html>
  <head></head>
  <body>
<center>
<% 
ShoppingDAO sd=new ShoppingDAO();
int id=Integer.parseInt(request.getParameter("id"));
double num=Double.parseDouble(request.getParameter("num"));
ShoppingBean sb=new ShoppingBean();
sb.setId(id);
sb.setNum(num);

if(sd.updateShopping(sb))
	out.println("修改成功!");
else
	out.println("修改失败!");
%>
<a href="index.jsp" target="_self">返回</a>
</center>
  </body>
</html>
