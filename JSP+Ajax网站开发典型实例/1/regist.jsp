<%@ page language="java" pageEncoding="gb2312"%>
<html>
  <head>
    <title>用户注册</title>
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
  <form id="form1" name="form1" method="post" action="regist_do.jsp">
    <p><strong>用户注册</strong></p>
    <table width="300" border="1">
      <tr>
        <td>用户名：</td>
        <td><input type="text" name="name" /></td>
      </tr>
      <tr>
        <td>密&nbsp;&nbsp;码：</td>
        <td><input type="password" name="pass" /></td>
      </tr>
	   <tr>
        <td>爱&nbsp;&nbsp;好：</td>
        <td><select name="love" size="3">
          <option value="登山" selected="selected">登山</option>
          <option value="篮球">篮球</option>
          <option value="足球">足球</option>
          <option value="游泳">游泳</option>
          <option value="看电影">看电影</option>
          <option value="聊天">聊天</option>
        </select></td>
	   </tr>
      <tr>
        <td colspan="2"><div align="center">
          <input type="submit" name="Submit" value="提交" />
          &nbsp;
          <input type="reset" name="Submit2" value="重置" />
        </div></td>
      </tr>
    </table>
  </form>
  </body>
</html>
