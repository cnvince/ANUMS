<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>

<%
String id=request.getParameter("key");
int num=Integer.parseInt(id);
String sql="delete from oa_chucai where id="+num;
con.Exec(sql);
out.print("1");
%>