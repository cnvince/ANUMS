<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>数据库事务操作</title>
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
  con=DriverManager.getConnection(url);//链接数据库
  con.setAutoCommit(false);//禁止自动提交事务
  stmt=con.createStatement();
  stmt.executeUpdate(sql1);
  stmt.executeUpdate(sql2);
  con.commit(); //统一提交。
  out.println("<center><b>转账成功</b></center>");
  out.println("<center>本次转账金额为："+money+"人民币</center>");
 }catch(SQLException e){
   con.rollback(); //倘若其中一项sql操作失败，就不会执行commit（）方法，而是产生相应的sqlexception，此时就可以捕获 异常代码块中调用rollback（）方法撤消事务。　
   out.print("转账失败，原因："+e.toString());
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

