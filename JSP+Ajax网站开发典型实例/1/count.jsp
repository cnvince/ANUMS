<%@ page language="java" pageEncoding="gb2312"%>
<html>
  <head>
    <title>使用Application对象做网站计数器</title>
    <style type="text/css">
      <!--
       body {
	        background-image: url(images/img.jpg);
       }
      -->
    </style>
  </head>
  <%
     Object oCount=application.getAttribute("count");
     Integer count=null;
     if(oCount==null){
       count=new Integer(1);
       application.setAttribute("count",count);
     }else{
       count=(Integer)application.getAttribute("count");
       count=new Integer(count.intValue()+1);
       application.setAttribute("count",count);
     }
   %>
  <body>
    <br>
    <h3>尊敬在访客您好！欢迎您的到来！</h3>
    您是这里的第<font color="red"><%=count.intValue() %></font>位访客，祝你玩的快乐！
  </body>
</html>
