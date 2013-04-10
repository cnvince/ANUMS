<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String name=request.getParameter("name");
String info="";
if(name.equals("联想天开台式电脑"))
	info="名称："+name+"<br>CPU:Intel 奔腾4<br>内存:DDRII 512M<br>价格：4999";
if(name.equals("联想旭日笔记本电脑"))
	info="名称："+name+"<br>CPU:迅驰赛扬<br>内存:DDRII 512M<br>价格：6999";
if(name.equals("TCL锐翔台式电脑"))
	info="名称："+name+"<br>CPU:Intel 奔腾4双核<br>内存:DDRII 512M<br>价格：5999";
out.print(info);
 %>

