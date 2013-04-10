<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>

<html>
<%
String id=request.getParameter("id");
int num=Integer.parseInt(id);
String sql="select * from oa_rizhi where id="+num;
ResultSet rs=con.getRs(sql);
rs.next();
%>
<table width='100%' border='0' cellpadding='0' cellspacing='1' >
<tr bgcolor="BCCEED"> <td >标题</td><td >日志类型</td><td >保密程度</td><td>日志内容</td><td >发布人</td><td >日志填写时间</td><td>操作</td></tr>
<tr bgcolor="E4EAF4"><td><%=rs.getString("title")%></td><td><%=rs.getString("type")%></td><td><%=rs.getString("secret")%></td><td><%=rs.getString("content")%></td><td><%=rs.getString("cjr")%></td><td><%=rs.getString("cjt")%></td><td><a href="" style="color:04329C">修改</a>&nbsp;&nbsp;<a href="" style="color:04329C">删除</a></td></tr>
</table>
</html>