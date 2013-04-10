<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>结帐</title>
    <style type="text/css">
      <!--
       body {
	        background-image: url(images/img.jpg);
       }
      -->
    </style>
  </head>
  <body>
     非常感谢您的光临！您本次在我们这里购买了以下商品：<br>
    <%
      ArrayList list=(ArrayList)session.getAttribute("list");
      for(int i=0;i<list.size();i++){
        String goodsName=(String)list.get(i);
     %>
     商品<%=i %> : <%=goodsName %><br>
     <%} %>
  </body>
</html>
