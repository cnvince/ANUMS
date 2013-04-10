<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%
String name=(String)session.getAttribute("name");
String sq="select * from oa_user where zhangh='liu'";
ResultSet rss=con.getRs(sq);
String bum="";
while(rss.next()){
bum=rss.getString("bum");
}
out.print(bum);
%>