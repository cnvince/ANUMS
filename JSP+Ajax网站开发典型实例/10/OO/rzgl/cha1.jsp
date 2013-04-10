<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%
try
 {
String title=request.getParameter("title");
String starttime=request.getParameter("starttime");
String type=request.getParameter("type");
String range=request.getParameter("range");
title=new String(title.getBytes("iso-8859-1"),"utf-8");
type=new String(type.getBytes("iso-8859-1"),"utf-8");
range=new String(range.getBytes("iso-8859-1"),"utf-8");
String name=(String)session.getAttribute("name");
String sql="";
if(range.equals("本人日志") && (!type.equals("全部类型")))
   sql="select * from oa_rizhi where title='"+title+"' and type='"+type+"' and to_days(rizit)=to_days('"+starttime+"') and cjr='"+name+"'";

if(range.equals("本人日志") && (type.equals("全部类型")))
   sql="select * from oa_rizhi where title='"+title+"' and to_days(rizit)=to_days('"+starttime+"') and cjr='"+name+"'";
if(range.equals("他人日志") && (!type.equals("全部类型")))
   sql="select * from oa_rizhi where title='"+title+"' and type='"+type+"' and to_days(rizit)=to_days('"+starttime+"') and cjr!='"+name+"'";
if(range.equals("他人日志") && (type.equals("全部类型")))
   sql="select * from oa_rizhi where title='"+title+"' and to_days(rizit)=to_days('"+starttime+"') and cjr!='"+name+"'";
  ResultSet rs=con.executeQuery(sql);
  StringBuffer content=new StringBuffer(""); 
  response.setContentType("text/xml"); 
  response.setHeader("Cache-Control","no-cache");
  content.append("<?xml version=\"1.0\"   encoding=\"UTF-8\" ?>");
  content.append("<contents>");
while(rs.next())
{
     int id=rs.getInt("id");
     String title1=rs.getString("title");
     String tizit=rs.getString("rizit");
     String cjr=rs.getString("cjr");
     content.append("<content>");
     content.append("<id>"+id+"</id>");
     content.append("<title>"+title1+"</title>");
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




