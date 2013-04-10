<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>1000条记录重复插入</title>
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
    String name=request.getParameter("name");
    name=new String(name.getBytes("ISO-8859-1"));
    String tel=request.getParameter("tel");
    String sql=null;
    //getConnection()方法将在下一步定义
    PreparedStatement stmt=getConnection().prepareStatement("INSERT INTO friends VALUES(?,?, ?)"); 
    try{
      for(int i=1; i<=1000; i++) { 
        stmt.setInt(1, i); 
        stmt.setString(2, name); 
        stmt.setString(3, tel); 
        stmt.addBatch(); 
      } 
      stmt.executeBatch();  
       stmt.close();
       out.println("<center><b>1000条记录插入完毕</b></center>");
    }catch(Exception e){
     out.println(e.toString());
    }
   %>
  </body>
</html>
<%!
//连接数据库，取得Connection对象
public Connection getConnection(){
  try{
     Class.forName("com.mysql.jdbc.Driver");
	 String url="jdbc:MySQL://localhost:3306/friend?user=root&password=tmq&characterEncoding=gb2312";
	 Connection con=DriverManager.getConnection(url);
	 return con;
  }catch(Exception e){return null;}
}
%>

