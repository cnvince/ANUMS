<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%
String str=request.getParameter("title");
str=new String(str.getBytes("iso-8859-1"),"utf-8");
String name=(String)session.getAttribute("name");
String sql="select * from oa_user where zhangh='"+name+"'";
ResultSet rs=con.getRs(sql);
rs.next();
String zhens=rs.getString("name");
String bum=rs.getString("bum");
SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");  
String Add_time = formatter.format(new java.util.Date()); 
SimpleDateFormat formatter1 = new SimpleDateFormat ("yyyy-MM-dd");  
String Add_time1 = formatter1.format(new java.util.Date()); 
String sq="";
if(str.equals("ÉÏÎç¿¼ÇÚÇ©Èë"))
   sq="insert into oa_kaoqin (name,skr,kqt,bum,zhangh) values ('"+zhens+"','"+Add_time+"','"+Add_time1+"','"+bum+"','"+name+"')";
if(str.equals("ÉÏÎç¿¼ÇÚÇ©³ö"))
   sq="update oa_kaoqin set skc='"+Add_time+"' where zhangh='"+name+"'";
if(str.equals("ÏÂÎç¿¼ÇÚÇ©Èë"))
   sq="update oa_kaoqin set xkr='"+Add_time+"' where zhangh='"+name+"'";
if(str.equals("ÏÂÎç¿¼ÇÚÇ©³ö"))
   sq="update oa_kaoqin set xkc='"+Add_time+"' where zhangh='"+name+"'";

con.Exec(sq);
out.print("1");

%>