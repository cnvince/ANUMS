<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>���ݿ��������</title>
  </head>
<style type="text/css">
<!--
body {
	background-image: url(images/img.jpg);
}
-->
</style>
<%
  Connection con=null;
  Statement stmt=null;
  double money=Double.parseDouble(request.getParameter("money"));
  String sql1 = "update system1 set money=money-"+money+" where name='user1'";
  String sql2 = "update system2 set money=money+"+money+" where name='user2'";
  String url="jdbc:mysql://localhost:3306/account?user=root&password=tmq&characterEncoding=gb2312";
try{
  Class.forName("com.mysql.jdbc.Driver");
  con=DriverManager.getConnection(url);//�������ݿ�
  con.setAutoCommit(false);//��ֹ�Զ��ύ����
  stmt=con.createStatement();
  stmt.executeUpdate(sql1);
  stmt.executeUpdate(sql2);
  con.commit(); //ͳһ�ύ��
  out.println("<center><b>ת�˳ɹ�</b></center>");
  out.println("<center>����ת�˽��Ϊ��"+money+"�����</center>");
 }catch(SQLException e){
   con.rollback(); //��������һ��sql����ʧ�ܣ��Ͳ���ִ��commit�������������ǲ�����Ӧ��sqlexception����ʱ�Ϳ��Բ��� �쳣������е���rollback���������������񡣡�
   out.print("ת��ʧ�ܣ�ԭ��"+e.toString());
 }finally{
  if(stmt!=null){
  stmt.close();
  }
  if(con!=null){
   stmt.close();
  }
 }
 %>
 <body>
 </body>
 </html>

