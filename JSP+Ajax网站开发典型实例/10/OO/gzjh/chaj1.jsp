<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%
  try{
  String jhmc=request.getParameter("name");
  jhmc=new String(jhmc.getBytes("ISO-8859-1"),"gb2312");
  String jhr=(String)session.getAttribute("name");
  String sql="select * from oa_jihua where mc='"+jhmc+"' and jhr='"+jhr+"'";
  StringBuffer content=new StringBuffer(""); 
  response.setContentType("text/xml"); 
  response.setHeader("Cache-Control","no-cache");
  content.append("<?xml version=\"1.0\"   encoding=\"UTF-8\" ?>");
  content.append("<contents>");
  ResultSet rs=con.getRs(sql);
  while(rs.next()){
     String mc=rs.getString("mc");
     String jibie=rs.getString("jibie");
     String zhuangt=rs.getString("zhuangt");
     String shit=rs.getString("shit");
     String zhi=rs.getString("zhi");

     content.append("<content>");
     content.append("<mc>"+mc+"</mc>");
     content.append("<jibie>"+jibie+"</jibie>");
     content.append("<zhuangt>"+ zhuangt +"</zhuangt>");
     content.append("<shit>"+ shit +"</shit>");
     content.append("<zhi>"+zhi +"</zhi>");
     content.append("</content>");
     }
   content.append("</contents>");
   out.print(content);
  }
 catch(Exception e){
      e.printStackTrace();
   }
%>
