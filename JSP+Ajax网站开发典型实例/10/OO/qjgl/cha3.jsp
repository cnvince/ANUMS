﻿<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%
    String title=request.getParameter("title");
    String starttime=request.getParameter("starttime");
    String endtime=request.getParameter("endtime");
    title=new String(title.getBytes("iso-8859-1"),"utf-8");
    String sql="select * from oa_qingjia where title='"+title+"' and starttime='"+starttime+"' and endtime='"+endtime+"' and ischu='1'";
    ResultSet rs=con.getRs(sql);
    StringBuffer content=new StringBuffer(""); 
    response.setContentType("text/xml"); 
    response.setHeader("Cache-Control","no-cache");
    content.append("<?xml version=\"1.0\"   encoding=\"UTF-8\" ?>");
    content.append("<contents>");
    while(rs.next()){
     int id=rs.getInt("id");
     String title1=rs.getString("title");
     String sercet=rs.getString("secret");
     String jinj=rs.getString("jinj");
     String starttime1=rs.getString("starttime");
     String endtime1=rs.getString("endtime");
     String tt=starttime+"至"+endtime;
      content.append("<content>");
     content.append("<id>"+id+"</id>");
     content.append("<title>"+title1+"</title>");
     content.append("<sercet>"+sercet+"</sercet>");
     content.append("<jinj>"+jinj+"</jinj>");
     content.append("<tt>"+ tt+"</tt>");
     content.append("</content>");
     }
 content.append("</contents>");
 out.print(content);
%>
