<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>����</title>
    <style type="text/css">
      <!--
       body {
	        background-image: url(images/img.jpg);
       }
      -->
    </style>
  </head>
  <body>
     �ǳ���л���Ĺ��٣����������������ﹺ����������Ʒ��<br>
    <%
      ArrayList list=(ArrayList)session.getAttribute("list");
      for(int i=0;i<list.size();i++){
        String goodsName=(String)list.get(i);
     %>
     ��Ʒ<%=i %> : <%=goodsName %><br>
     <%} %>
  </body>
</html>
