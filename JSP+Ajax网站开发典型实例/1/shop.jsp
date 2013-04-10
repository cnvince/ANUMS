<%@ page language="java" pageEncoding="gb2312"%>
<html>
  <head>
    <title>购物网站</title>
    <style type="text/css">
      <!--
       body {
	        background-image: url(images/img.jpg);
       }
      -->
    </style>
  </head>
  <body>
    <div align="center">
  <form id="form1" name="form1" method="post" action="shop_do.jsp">
    <p><strong>请选择你要购买的商品</strong></p>
    <table width="300" border="1">
      <tr>
        <td>商品名：</td>
        <td><input type="text" name="goods" /></td>
      </tr>
      <tr>
        <td colspan="2"><div align="center">
          <input type="submit" name="Submit" value="加入购物车" />&nbsp;
          <input type="reset" name="Submit2" value="重选" />
        </div></td>
      </tr>
    </table>
  </form>
</div>
  </body>
</html>
