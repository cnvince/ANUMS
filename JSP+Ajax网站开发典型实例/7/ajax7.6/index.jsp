<%@ page language="java" import="com.*" pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	String age=request.getParameter("age");
    UserDAO ud=new UserDAO();
    if(id==null||id=="null")
    	out.print(ud.getUsers());
    else
    {
    	if(ud.updateUser(id,age))
     		out.print(ud.getUsers());
     }
%>

