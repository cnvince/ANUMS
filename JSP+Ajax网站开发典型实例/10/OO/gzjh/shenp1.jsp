<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%
String id=request.getParameter("name");
out.print(id);
%>