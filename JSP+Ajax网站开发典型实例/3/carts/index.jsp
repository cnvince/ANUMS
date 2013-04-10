<%@ page language="java" import="java.util.*,com.*" pageEncoding="utf-8"%>

<%
ShoppingDAO  sd=new ShoppingDAO();
Vector v=new Vector();
v=sd.getShopping();
%>
<html>
  <head></head>
<body>
<center><h2>简单购物车</h2></center>
<form action="addProduct.jsp" method="post">
  <table width="80%" border="1" align="center">
    <tr>
      <td colspan="2"><center>
        商品列表:
        <select name="name">
          <option value="apple">apple</option>
          <option value="Pear">Pear</option>
          <option value="Banana">Banana</option>
          <option value="orange">orange</option>
          <option value="Watermelon">Watermelon</option>
        </select>
		&nbsp;&nbsp;
		购买数量:<input type="text" name="num">
		&nbsp;&nbsp;
        <input type="submit" value="添加">
      </center></td>
      <td colspan="2"><center>
        下面是您以购买的商品
      </center></td>
    </tr>
  </table>
  </form>
 <table width="80%" border="1" align="center">
     <tr>
      <td width="26%"><center>
        商品名称
      </center></td>
      <td width="27%"><center>
       购买数量
      </center></td>
      <td width="20%"><center>
        修改数量
      </center></td>
      <td width="27%"><center>
        删除商品
      </center></td>
    </tr>
 <%
 for(int j=0;j<v.size();j++)
 {
 	if(v.get(j)!=null)
 	{
 		ShoppingBean sb=new ShoppingBean();
 		sb=(ShoppingBean)v.get(j);
%>
    <tr>
      <td width="26%"><center>
        <%=sb.getName() %>
      </center></td>
      <td width="27%"><center>
       <%=sb.getNum() %>
      </center></td>
      <td width="20%"><center>
		<a href="editProduct.jsp?id=<%=sb.getId() %>">修改数量</a>
      </center></td>
      <td width="27%"><center>
        <a href="delProduct.jsp?id=<%=sb.getId() %>">删除商品</a>
      </center></td>
    </tr>
<%		
 	}
 }
 %>
 </table> 
  </body>
</html>
