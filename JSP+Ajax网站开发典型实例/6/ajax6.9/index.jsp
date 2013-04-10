<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String menu=request.getParameter("obj");    //接受参数
String value="";
if(menu.equals("lx"))
	value="<table border='0'><tr><td style='cursor:hand'><img src='images/blank.gif' border='0'><img src='images/blank.gif' border='0'><img src='images/sheet.gif' border='0'>联想 天逸F41A-PT</td></tr><tr><td style='cursor:hand'><img src='images/blank.gif' border='0'><img src='images/blank.gif' border='0'><img src='images/sheet.gif' border='0'>联想 旭日C461M-MX</td></tr><tr><td style='cursor:hand'><img src='images/blank.gif' border='0'><img src='images/blank.gif' border='0'><img src='images/sheet.gif' border='0'>联想 昭阳E42A</td></tr></table>";
if(menu.equals("sx"))
		value="<table border='0'><tr><td style='cursor:hand'><img src='images/blank.gif' border='0'><img src='images/blank.gif' border='0'><img src='images/sheet.gif' border='0'>三星 Q45-XY05</td></tr><tr><td style='cursor:hand'><img src='images/blank.gif' border='0'><img src='images/blank.gif' border='0'><img src='images/sheet.gif' border='0'>三星 R23-DE01</td></tr><tr><td style='cursor:hand'><img src='images/blank.gif' border='0'><img src='images/blank.gif' border='0'><img src='images/sheet.gif' border='0'>三星 FY05</td></tr></table>";
if(menu.equals("dr"))
	value="<table border='0'><tr><td style='cursor:hand'><img src='images/blank.gif' border='0'><img src='images/blank.gif' border='0'><img src='images/sheet.gif' border='0'>戴尔 Inspiron 1525</td></tr><tr><td style='cursor:hand'><img src='images/blank.gif' border='0'><img src='images/blank.gif' border='0'><img src='images/sheet.gif' border='0'>戴尔 XPS M1330</td></tr></table>";
out.print(value);   //向客户端输出信息
%>

