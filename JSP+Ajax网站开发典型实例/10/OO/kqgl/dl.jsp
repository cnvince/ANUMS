<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*" %> 
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%
String key=request.getParameter("key");
key=new String(key.getBytes("iso-8859-1"));
String a[]=key.split("/");
String sql="select * from oa_kaoqin where name='"+a[0]+"' and to_days(kqt)=to_days('"+a[1]+"')";
ResultSet rs=con.getRs(sql);
if(rs.next()){
String d1=rs.getString("skr");
String b[]=d1.split(" ");
String d2=rs.getString("skc");
String c[]=d2.split(" ");
String d3=rs.getString("xkr");
String dd[]=d3.split(" ");
String d4=rs.getString("xkc");
String e[]=d4.split(" ");
String s="����ǩ��ʱ��"+b[1]+"\n����ǩ��ʱ��"+c[1]+"\n����ǩ��ʱ��"+dd[1]+"\n����ǩ��ʱ��"+e[1];
out.print(s);}
else{
out.print("û��ǩ����¼");
}
%>