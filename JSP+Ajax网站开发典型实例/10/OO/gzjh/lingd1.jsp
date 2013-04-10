<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%
try{
   String ry=request.getParameter("ry");
   String timeid=request.getParameter("timeid");
   ry=new String(ry.getBytes("iso-8859-1"));
   timeid=new String(timeid.getBytes("iso-8859-1"));
   String strArray[]=ry.split("/");
   String sql="";
   if(timeid.equals("全部"))
       {sql="select * from oa_jihua where jhr='"+strArray[0]+"'";}
   if(timeid.equals("周计划"))
       {sql="select * from oa_jihua where jhr='"+strArray[0]+"' and shij='周计划'"; }
   if(timeid.equals("月计划"))
       {sql="select * from oa_jihua where jhr='"+strArray[0]+"' and shij='月计划'"; }
   if(timeid.equals("季度计划"))
       {sql="select * from oa_jihua where jhr='"+strArray[0]+"' and shij='季度计划'"; }
   if(timeid.equals("年计划"))
       {sql="select * from oa_jihua where jhr='"+strArray[0]+"' and shij='年计划'"; }

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

     content.append("<content>");
     content.append("<mc>"+mc+"</mc>");
     content.append("<jibie>"+jibie+"</jibie>");
     content.append("<zhuangt>"+ zhuangt +"</zhuangt>");
     content.append("<shit>"+ shit +"</shit>");
     content.append("</content>");
}
  content.append("</contents>");
  out.print(content);
}
catch(Exception e){
 out.print(e);
}
%>