<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.UserDAO;"%>
<%
String op=request.getParameter("op");
UserDAO ud=new UserDAO();
if(op.equals("add"))
	ud.addUser("李小晚","20");
if(op.equals("update"))
	ud.updateUser("李小晚","24");
if(op.equals("del"))
	ud.delUser("李小晚");

out.println(ud.getUser());
%>


