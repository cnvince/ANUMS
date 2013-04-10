<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<html>
<head>
<title>
计数器
</title>
</head>
<jsp:useBean id="counter" scope="page" class="com.CounterBean" />
<body bgcolor="#ffffff">
<center><h1>一个简单的计数器</h1></center>
<br>
<center>已经有<font color="blue"><%=counter.getCounter()%></font>人次访问这个页面了！</center>
</body>
</html>
