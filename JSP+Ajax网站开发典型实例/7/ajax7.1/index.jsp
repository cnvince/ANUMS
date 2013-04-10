<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.DatabaseDAO;"%>
<%
DatabaseDAO dbdao=new DatabaseDAO();
out.println(dbdao.getTableInfo());
%>


