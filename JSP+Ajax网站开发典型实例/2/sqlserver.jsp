<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<html>
  <head>
    <title>sqlserver���ݿ�����</title>
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
      Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver").newInstance();
      String��url="jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=test";
      //test��Ϊ������ݿ��
      String��name="sa";//�û���
      String��pass="admin";//����
      Connection��conn=��DriverManager.getConnection(url,name,pass);
      out.print("<br><center>��ϲ�㣡SQL Server���ݿ����ӳɹ���</center>");
      conn.close(); //�ر����Ӷ���
    }catch(Exception e){
      out.print("���ݿ����Ӵ���,������Ϣ���£�<br>");
      out.print(e.getMessage());
   }
%>
</body>
</html> 