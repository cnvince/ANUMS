<%@ page language="java" pageEncoding="gb2312"%>
<html>
  <head>
    <title>����ҳ��</title>
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
      String love=request.getParameter("love");
      if((!name.equals(""))&&(!pass.equals(""))){
        name=new String(name.getBytes("ISO-8859-1"));//����ת��,����������롣
        pass=new String(pass.getBytes("ISO-8859-1"));
        love=new String(love.getBytes("ISO-8859-1"));
    %>
    <center>
      <b><%=name %>  ���ã� ����ע����Ϣ���£�</b><br>
      �û�����<%=name %><br>
      ����:<%=pass %><br>
      ����:<%=love %>
    </center>
    <%
      }else{
    %><center>�Բ�����û����д������</center><%
      }  
    %>
  </body>
</html>
