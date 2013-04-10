<%@ page language="java" import="java.util.*,com.*" pageEncoding="utf-8"%>

<html>
  <head></head>
  
<body>
<center>
<%
request.setCharacterEncoding("utf-8");
String name=request.getParameter("name");
double num=Double.parseDouble(request.getParameter("num"));
ShoppingDAO sd=new ShoppingDAO();
ShoppingBean sb=new ShoppingBean();
sb.setName(name);
sb.setNum(num);

if(sd.addShopping(sb))
	out.println("购买成功!");
else
	out.println("购买失败!");

%>
<a href="index.jsp" target="_self">返回</a>
</center>
  </body>
</html>
