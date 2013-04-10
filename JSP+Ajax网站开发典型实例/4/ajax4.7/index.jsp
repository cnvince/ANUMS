<%@ page language="java" import="java.util.*,com.*" pageEncoding="utf-8"%>
<html>
<body>
<center><h2>JSP+Servlet+JavaBean实现通讯录</h2></center>
 <table  border="0" align="center" >
     <tr style="background:#999999">
      <td><center>姓名</center></td>
      <td><center>年龄</center></td>
      <td><center>性别</center></td>
      <td><center>地址</center></td>
      <td><center>电话</center></td>
      <td><center>QQ</center></td>
      <td><center>电子邮件</center></td>
      <td><center>修改</center></td>
      <td><center> 删除</center></td>
    </tr>
 <%
 Vector v=(Vector)session.getAttribute("tongList");
 for(int j=0;j<v.size();j++)
 {
 	if(v.get(j)!=null)
 	{
 		TongBean tb=new TongBean();
 		tb=(TongBean)v.get(j);
%>
    <tr>
      <td><center><%=tb.getName() %></center></td>
      <td><center><%=tb.getAge() %></center></td>
      <td><center><%=tb.getSex() %></center></td>
      <td><center><%=tb.getAddress() %></center></td>
      <td><center><%=tb.getPhone() %></center></td>
      <td><center><%=tb.getQq() %></center></td>
      <td><center><%=tb.getEmail() %></center></td>
      <td><center>
        <a href="DBServlet.html?type=one&id=<%=tb.getId() %>">修改</a>
      </center></td>
      <td><center>
        <a href="DBServlet.html?type=del&id=<%=tb.getId() %>">删除</a>
      </center></td>
    </tr>
<%		
 	}
 }
 %>
 </table> 
 <br>
 <center><a href="addTong.html">添加信息</a></center>
  </body>
</html>
