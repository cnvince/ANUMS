<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>ʹ��request����ҳ��</title>
  </head>
<style type="text/css">
<!--
body {
	background-image: url(images/img.jpg);
}
-->
</style>
  <body><br>
    <%
      String name=request.getParameter("name");
      String pass=request.getParameter("pass");
      if(!(name.equals("")||pass.equals(""))){
         name=new String(name.getBytes("ISO-8859-1"));//������������
    %>
    <center>
      <b>��ӭ<%=name %>�ĵ�����</b><br>
      ����¼��ʱ��Ϊ��<%=new Date().toLocaleString() %>
    </center>
    <%
      }else{
    %><center>�Բ�����û�е�¼�ɹ���</center><%
      }  
    %>
  </body>
</html>
