<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%
try
 {
String name=(String)session.getAttribute("name"); 
String sql="select * from oa_rizhi where cjr='"+name+"' and  to_days(rizit)=to_days(now())";
ResultSet rs=con.executeQuery(sql);
  StringBuffer content=new StringBuffer(""); 
  response.setContentType("text/xml"); 
  response.setHeader("Cache-Control","no-cache");
  content.append("<?xml version=\"1.0\"   encoding=\"UTF-8\" ?>");
  content.append("<contents>");
while(rs.next())
{
     int id=rs.getInt("id");
     String title=rs.getString("title");
     String tizit=rs.getString("rizit");
     String cjr=rs.getString("cjr");
     content.append("<content>");
     content.append("<id>"+id+"</id>");
     content.append("<title>"+title+"</title>");
     content.append("<tizit>"+tizit+"</tizit>");
     content.append("<cjr>"+cjr+"</cjr>");
     content.append("</content>");
 }
 content.append("</contents>");
 out.print(content);
 }
 catch(Exception e)
 {
 e.printStackTrace();
 }
 %>




