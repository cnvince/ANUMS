<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>数据库存储过程</title>
  </head>
<style type="text/css">
<!--
body {
	background-image: url(images/img.jpg);
}
-->
</style>
<body>
<% 
   String proc="{call insertIN(?)}";
   try {
    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:MySQL://localhost:3306/mytest?user=root&password=tmq&characterEncoding=gb2312";
    Connection con=DriverManager.getConnection(url);
    CallableStatement stmt=con.prepareCall(proc);
    stmt.setInt(1, 9);
    stmt.execute();
    stmt.close(); 
    out.println("<br>MySQL数据库存储过程insertIN(IN param1 INT)被JSP成功调用！");        
   } catch (SQLException e) {
      out.println(e.toString());
   }   
%>
</body>
</html>