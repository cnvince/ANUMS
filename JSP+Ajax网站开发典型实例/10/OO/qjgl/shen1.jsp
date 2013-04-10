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
    content="同意请假。"+yijian;
if(pi.equals("0"))
    content="不同意请假。"+yijian;
String sql="update oa_qingjia set ischu='1',chuyi='"+content+"' where id="+num;
con.Exec(sql);
out.print("1");
%>