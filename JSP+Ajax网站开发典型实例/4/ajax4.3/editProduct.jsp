<%@ page language="java" import="java.util.*,com.*" pageEncoding="utf-8"%>
<html>
<body>
<%
ShoppingBean sb=(ShoppingBean)session.getAttribute("shoppingOne");
 %>
 <center>
 <form action="DBServlet.html?type=update" method="post">
 商品名称:<%=sb.getName() %>&nbsp;&nbsp;购买数量:<input type="text" name="num" value="<%=sb.getNum() %>">&nbsp;&nbsp;<input type="submit" value="修改数量">
 <input type="hidden" value="<%=sb.getId() %>" name="id">
 </form>
 </center>
</body>
</html>
