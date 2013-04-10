<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*"%>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%!
  public String getS(String str){
       try{
              byte b[]=str.getBytes("ISO-8859-1");
              str=new String(b,"UTF-8");
               return str;
          }
         catch(Exception e){
             return "error";
         }
  }
%>
<%
String name=(String)session.getAttribute("name");
String nc=request.getParameter("nc");
nc=getS(nc);
String mail=request.getParameter("mail");
String shouj=request.getParameter("shouj");
String phone=request.getParameter("phone");
if(phone==null)
   phone="88888888";
String zhu=request.getParameter("zhu");
if(zhu==null)
   zhu="нч";
zhu=getS(zhu);
String sql="update oa_user set nic='"+nc+"',mail='"+mail+"',shouj='"+shouj+"',gphone='"+phone+"',jzhu='"+zhu+"' where zhangh='"+name+"'";
con.Exec(sql);
out.print("1");
%>