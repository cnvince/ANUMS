<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%
String year=request.getParameter("year");
String month=request.getParameter("month");
String date=request.getParameter("date");
String str=year+"-"+month+"-"+date;
String name=(String)session.getAttribute("name");
String sql="select * from oa_kaoqin where to_days(kqt)=to_days('"+str+"') and zhangh='"+name+"'";
ResultSet rs=con.getRs(sql);
if(rs.next()){
String d1=rs.getString("skr");
String d2=rs.getString("skc");
String d3=rs.getString("xkr");
String d4=rs.getString("xkc");
String dd="上午签入时间为："+d1+"\n上午签出时间："+d2+"\n下午签入时间："+d3+"\n下午签出时间："+d4;
out.print(dd);
}
else{
String ddd="没有签入记录";
out.print(ddd);
}
%>