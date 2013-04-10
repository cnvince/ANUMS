<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String type=request.getParameter("obj");//接受参数值
if(type.equals("p"))
	out.print("<br>1.戴尔笔记本<br><br>2.联想笔记本<br><br>3.三星笔记本<br><br>4.TCL笔记本<br><br>5.方正笔记本");
if(type.equals("m"))
	out.print("<br>1.金士顿内存<br><br>2.现代内存<br><br>3.三星内存<br><br>4.金泰克内存<br><br>5.超胜内存");
if(type.equals("d"))
	out.print("<br>1.三星显示器<br><br>2.优派显示器<br><br>3.飞利浦显示器<br><br>4.美格显示器<br><br>5.AOC显示器");
%>

