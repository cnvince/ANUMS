<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<html>
  <head>
    <title>Access���ݿ�����</title>
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

    try
    {
        //���¼����������޸�
        String path = "D:\\test.mdb";//Access ���ݿ�·��
        String name = "";        //Acvess ���ݿ��û�����û����Ϊ��
        String pass = "";        //Access ���ݿ����룬û����Ϊ��
        //���ݿ������ַ��� 
        String url ="jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ="+path; 
        //������������
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        //��������
        Connection conn= DriverManager.getConnection(url,name,pass); 
        out.print("<br><center>��ϲ�㣡Access���ݿ����ӳɹ���</center>");
        conn.close();                                //�ر����Ӷ���
    }catch(Exception e){
        out.print("���ݿ����Ӵ���,������Ϣ���£�<br>");
        out.print(e.getMessage());
        }
%>
</body>
</html>