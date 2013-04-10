<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>第一个JSP测试页面</title>
    <style type="text/css">
<!--
body {
	background-image: url(images/img.jpg);
}
-->
</style>
  </head>
  <body>
    <p align="center"><b>Hello,恭喜你测试成功</b></p><br>
    <p align="center">现在时间是：<%=new Date() %></p>
  </body>
</html>
