<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>MySQL���ݿ�����</title>
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
  try{
     Class.forName("com.mysql.jdbc.Driver");
	 String url="jdbc:MySQL://localhost:3306/test?user=root&password=tmq";
	 Connection conn=DriverManager.getConnection(url);
         out.print("<br><center>��ϲ�㣡Mysql���ݿ����ӳɹ���</center>");
         conn.close();    //�ر����Ӷ���
    }catch(Exception e){
        out.print("���ݿ����Ӵ���,������Ϣ���£�<br>");
        out.print(e.getMessage());
    }
%>
  </body>
</html>