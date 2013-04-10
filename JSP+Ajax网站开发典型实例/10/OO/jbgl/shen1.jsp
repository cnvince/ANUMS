<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>


<%
String pi=request.getParameter("s");
String yijian=request.getParameter("yijian");
String id=request.getParameter("id");
int num=Integer.parseInt(id);
yijian=new String(yijian.getBytes("iso-8859-1"),"utf-8");
String content="";
if(pi.equals("1"))
    content="同意出差。"+yijian;
if(pi.equals("0"))
    content="不同意出差。"+yijian;
String sql="update oa_jiaban set ischu='1',yijian='"+content+"' where id="+num;
con.Exec(sql);
out.print("1");
%>