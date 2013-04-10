<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>获取Cookie对象保存页面信息</title>
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
       response.addCookie(myCookie);//将myCookie保存到客户端
       response.addCookie(book_ord);//将myCookie保存到客户端
       Cookie allCookie[]=request.getCookies();//获得所有的Cookie
     %>
     <center>
       <h3>客户端的Cookie信息有：</h3>
       <table width="400" border="1">
      <tr align="center">
        <th>索引</th>
        <th>内容</th>
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
