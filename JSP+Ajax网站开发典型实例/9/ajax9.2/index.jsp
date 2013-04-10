<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java"%>
<%@ page import="java.sql.*,com.userDAO"%>
<%
	String name=request.getParameter("name");  //接受参数值
	String pwd=request.getParameter("pwd");
	userDAO ud=new userDAO();
	String value=ud.checkLogin(name,pwd);  //查询数据库
	out.print(value);
 %>
