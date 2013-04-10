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
String zhangh=request.getParameter("zhangh");
String pws=request.getParameter("pws");
String zhenshi=request.getParameter("zhenshi");
zhenshi=getS(zhenshi);
String nc=request.getParameter("nc");
nc=getS(nc);
String gangw=request.getParameter("gangw");
gangw=getS(gangw);

String bum=request.getParameter("bum");
bum=getS(bum);
String mail=request.getParameter("mail");
String shouj=request.getParameter("shouj");
String phone=request.getParameter("phone");
String zhu=request.getParameter("zhu");
zhu=getS(zhu);
String ip=request.getRemoteAddr();
SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");  
String Add_time = formatter.format(new java.util.Date());  

//out.print(zhangh+pws+zhenshi+nc+gangw+bum+mail+shouj+phone+zhu);
Connection conn=con.get();
Statement st=conn.createStatement();
String sql="insert into oa_user (zhangh,zhangm,name,nic,gangw,bum,mail,shouj,gphone,jzhu,ip,cishu,dtime) values ('"+zhangh+"','"+pws+"','"+zhenshi+"','"+nc+"','"+gangw+"','"+bum+"','"+mail+"','"+shouj+"','"+phone+"','"+zhu+"','"+ip+"','0','"+Add_time+"')";
st.executeUpdate(sql);
out.print("1");
%>