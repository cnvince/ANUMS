<%@ page language="java" pageEncoding="gb2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>简单新闻发布系统</title>
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
 <form action="pub_do.jsp" method="post">
  <table width="600" border="0">
    <tr>
      <th scope="col">新闻发布系统</th>
    </tr>
    <tr>
      <td><div align="center">新闻题目：
          <input name="title" type="text" size="60" />
      </div></td>
    </tr>
    <tr>
      <td><hr size="2"/></td>
    </tr>
    <tr>
      <td><div align="center">新闻内容</div></td>
    </tr>
    <tr>
      <td><div align="center">
        <textarea name="content" cols="65" rows="15"></textarea>
      </div></td>
    </tr>
    <tr>
      <td><hr size="2"/></td>
    </tr>
    <tr>
      <td><div align="center">
        <input type="submit" name="Submit" value="发布" />
      </div></td>
    </tr>
  </table>
 </form>
</div>
  </body>
</html>
