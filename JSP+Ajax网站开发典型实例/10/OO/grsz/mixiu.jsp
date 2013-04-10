<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%
  String oldpassword=request.getParameter("oldpassword");
  String newpassword=request.getParameter("newpassword");
  String name=(String)session.getAttribute("name");
  String sql="select * from oa_user where zhangh='"+name+"' and zhangm='"+oldpassword+"'";
  ResultSet rs=con.getRs(sql);
  if(rs.next()){
          String sq="update oa_user set zhangm='"+newpassword+"' where zhangh='"+name+"'";
          con.Exec(sq);
          out.print("1");
      }
  else{
          out.print("0");
    }
%>