<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>��ȡCookie���󱣴�ҳ����Ϣ</title>
<style type="text/css">
<!--
body {
	background-image: url(images/img.jpg);
}
-->
</style>
  </head>
  <body>
    <%
       Cookie myCookie=new Cookie("name","Tom");
       Cookie book_ord=new Cookie("ID","023922-01");
       response.addCookie(myCookie);//��myCookie���浽�ͻ���
       response.addCookie(book_ord);//��myCookie���浽�ͻ���
       Cookie allCookie[]=request.getCookies();//������е�Cookie
     %>
     <center>
       <h3>�ͻ��˵�Cookie��Ϣ�У�</h3>
       <table width="400" border="1">
      <tr align="center">
        <th>����</th>
        <th>����</th>
      </tr>
      <%
         for(int i=0;i<allCookie.length;i++){
         String index=allCookie[i].getName();
         String value=allCookie[i].getValue();
       %>
      <tr align="center">
        <td><%=index %></td>
        <td><%=value %></td>
      </tr>
      <%} %>
    </table>
     </center>
  </body>
</html>
