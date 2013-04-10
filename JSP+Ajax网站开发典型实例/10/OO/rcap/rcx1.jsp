<%@ page contentType="text/html; charset=utf-8"  %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>

<%
String name=(String)session.getAttribute("name"); 
String zhuti=request.getParameter("zhuti");
String starttime=request.getParameter("starttime");
String starthour=request.getParameter("starthour");
String startminute=request.getParameter("startminute");
String endtime=request.getParameter("endtime");
String endhour=request.getParameter("endhour");
String endminute=request.getParameter("endminute");
String type=request.getParameter("type");
String finish=request.getParameter("finish");
String fanw=request.getParameter("fanw");
String start=starttime+" "+starthour+":"+startminute+":00";
String end=endtime+" "+endhour+":"+endminute+":00";
zhuti=new String(zhuti.getBytes("iso-8859-1"),"utf-8");
type=new String(type.getBytes("iso-8859-1"),"utf-8");
finish=new String(finish.getBytes("iso-8859-1"),"utf-8");
fanw=new String(fanw.getBytes("iso-8859-1"),"utf-8");
String sql="";
try{
if(type.equals("不限") && fanw.equals("他人日程"))
    sql="select * from oa_richeng where zhuti='"+zhuti+"' and to_days(starttime)=to_days('"+start+"') and finish='"+finish+"'";
if(type.equals("不限") && fanw.equals("本人日程"))
       sql="select * from oa_richeng where zhuti='"+zhuti+"' and to_days(starttime)=to_days('"+start+"') and finish='"+finish+"' and cjr='"+name+"'";
if(!type.equals("不限") && fanw.equals("他人日程"))
       sql="select * from oa_richeng where zhuti='"+zhuti+"' and to_days(starttime)=to_days('"+start+"') and finish='"+finish+"' and arrtype='"+type+"'";
if(!type.equals("不限") && fanw.equals("本人日程"))
       sql="select * from oa_richeng where zhuti='"+zhuti+"' and to_days(starttime)=to_days('"+start+"') and finish='"+finish+"' and cjr='"+name+"'and arrtype='"+type+"'";

ResultSet rs=con.executeQuery(sql);
  StringBuffer content=new StringBuffer(""); 
  response.setContentType("text/xml"); 
  response.setHeader("Cache-Control","no-cache");
  content.append("<?xml version=\"1.0\"   encoding=\"UTF-8\" ?>");
  content.append("<contents>");
while(rs.next())
{
     int id=rs.getInt("id");
     String zhuti1=rs.getString("zhuti");
     String starttime1=rs.getString("starttime");
     String endtime1=rs.getString("endtime");
     String type1=rs.getString("arrtype");
     String priority=rs.getString("priority");
     String finish1=rs.getString("finish");
     content.append("<content>");
     content.append("<id>"+id+"</id>");
     content.append("<zhuti>"+zhuti1+"</zhuti>");
     content.append("<starttime>"+starttime+"</starttime>");
     content.append("<endtime>"+endtime+"</endtime>");
     content.append("<type>"+ type1 +"</type>");
     content.append("<priority>"+ priority +"</priority>");
     content.append("<finish>"+finish1 +"</finish>");
     content.append("<cjr>"+name+"</cjr>");
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




