<%@ page language="java" pageEncoding="gb2312"%>
<html>
  <head>
    <title>�û�ע��</title>
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
    <p><strong>�û�ע��</strong></p>
    <table width="300" border="1">
      <tr>
        <td>�û�����</td>
        <td><input type="text" name="name" /></td>
      </tr>
      <tr>
        <td>��&nbsp;&nbsp;�룺</td>
        <td><input type="password" name="pass" /></td>
      </tr>
	   <tr>
        <td>��&nbsp;&nbsp;�ã�</td>
        <td><select name="love" size="3">
          <option value="��ɽ" selected="selected">��ɽ</option>
          <option value="����">����</option>
          <option value="����">����</option>
          <option value="��Ӿ">��Ӿ</option>
          <option value="����Ӱ">����Ӱ</option>
          <option value="����">����</option>
        </select></td>
	   </tr>
      <tr>
        <td colspan="2"><div align="center">
          <input type="submit" name="Submit" value="�ύ" />
          &nbsp;
          <input type="reset" name="Submit2" value="����" />
        </div></td>
      </tr>
    </table>
  </form>
  </body>
</html>
