<%@ page import="java.util.*" contentType="text/html; charset=gb2312" %>
<%
response.setHeader("Cache-Control","no-cache");
out.println(new Date().toLocaleString()+" : "+(int)(Math.random()*20)); 
%> 
