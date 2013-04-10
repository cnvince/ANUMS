<%@ page language="java" import="java.util.*,com.*" pageEncoding="UTF-8"%>

<%
    UserDAO ud=new UserDAO();
 	out.print(ud.getUsers());
%>

