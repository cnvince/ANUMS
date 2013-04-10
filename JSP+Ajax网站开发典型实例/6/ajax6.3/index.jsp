<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String province=request.getParameter("province");
String city="";
if(province.equals("hn"))
	city="郑州,洛阳,开封";
if(province.equals("gd"))
	city="广州,深圳,珠海";
if(province.equals("hb"))
	city="武汉,十堰,宜昌";
if(province.equals("js"))
	city="南京,苏州,扬州";
out.print(city);
 %>

