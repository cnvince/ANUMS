<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>�������ݿ⡢����ֶ�</title>
  </head>
<style type="text/css">
<!--
body {
	background-image: url(images/img.jpg);
}
-->
</style>
  <body><center>
  <% 
  String sql=null;
  String url=null;
  Statement st=null;
  try{
    out.print("<b>������ʼ...</b><br>");
    sql="CREATE DATABASE test";
    url="jdbc:MySQL://localhost:3306?user=root&password=tmq&characterEncoding=gb2312";
    st=getStatement(url);
    st.execute(sql);
    out.print("<b>���ݿ�test�����ɹ�...</b><br>");
    sql="CREATE TABLE `table` (`field1` int(11),`field2` char(20),`field3` char(10))";
    url="jdbc:MySQL://localhost:3306/test?user=root&password=tmq&characterEncoding=gb2312";
    st=getStatement(url);
    st.execute(sql);
    out.print("<b>��table�����ɹ�...</b><br>");
    out.print("<b>��������...</b><br>");
    }catch(Exception e){
      out.print("<b>����ʧ��</b>ԭ��"+e.toString());
    }
  %>
   </center>
  </body>
</html>
<%!
//�������ݿ⣬ȡ��Statement����
public Statement getStatement(String url){
  try{
     Class.forName("com.mysql.jdbc.Driver");
	 
	 Connection con=DriverManager.getConnection(url);
	 return con.createStatement();
  }catch(Exception e){return null;}
}
%>

