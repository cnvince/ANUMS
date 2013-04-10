<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%
    String bum=request.getParameter("bum");
    String year=request.getParameter("year");
    String month=request.getParameter("month");
    bum=new String(bum.getBytes("iso-8859-1"),"utf-8");
    String sql="select * from oa_jiaban where jiac='"+bum+"' and month(starttime)='"+month+"' and year(starttime)='"+year+"'";
    ResultSet rs=con.getRs(sql);
    StringBuffer content=new StringBuffer(""); 
    response.setContentType("text/xml"); 
    response.setHeader("Cache-Control","no-cache");
    content.append("<?xml version=\"1.0\"   encoding=\"UTF-8\" ?>");
    content.append("<contents>");
    while(rs.next()){
     int id=rs.getInt("id");
     String title=rs.getString("title");
     String jiac=rs.getString("jiac");
     String starttime=rs.getString("starttime");
     String endtime=rs.getString("endtime");
      content.append("<content>");
     content.append("<id>"+id+"</id>");
     content.append("<title>"+title+"</title>");
     content.append("<jiac>"+jiac+"</jiac>");
     content.append("<starttime>"+starttime+"</starttime>");
     content.append("<endtime>"+endtime+"</endtime>");
     content.append("</content>");
     }
 content.append("</contents>");
 out.print(content);
%>
