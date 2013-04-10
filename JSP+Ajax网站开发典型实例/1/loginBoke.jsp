<%@ page language="java" pageEncoding="gb2312"%>
<html>
  <head>
    <title>表单页面</title>
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
  <form id="form1" name="form1" method="post" action="loginBoke_do.jsp">
    <p><strong>登录我的博客</strong></p>
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
        <td colspan="2"><div align="center">
          <input type="submit" name="Submit" value="提交" />
          &nbsp;
          <input type="reset" name="Submit2" value="重置" />
        </div></td>
      </tr>
    </table>
  </form>
</div>
  </body>
</html>
