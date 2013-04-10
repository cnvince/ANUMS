<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>

<html>
<head>
<title>已结束的工作</title>
</head>
<BODY topmargin="0">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
    <td height="13" class="guide">
	<img src="guide.gif" align="absmiddle"> 人事请假&gt;&gt;已处理文件</td>
  </tr>
</table>
<table border="0" cellspacing="8" cellpadding="0">
  <tr>
    <td class="whitebg">

      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="23" align="center" valign="middle" > 
			<a href="javascript:history.go(-1);" style="color:black;text-decoration:none;"> <img src="func_list.gif" border="0" align="absmiddle" alt="">返回</a>
		  </td>
        </tr>
      </table>

    </td>
  </tr>
</table>

<br>
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="maintable">
	<tr bgcolor="DCE6F4">
		<td width="58%" >工作名称</td>
		<td width="15%" >类 别</td>
		<td width="20%" >完成时间</td>
	</tr>
<%
String sql="select * from oa_qingjia where ischu='1'";
ResultSet rs=con.getRs(sql);
while(rs.next()){
int id=rs.getInt("id");
%>
<tr>
<td bgcolor="E4EAF4"><a href="xian.jsp?id=<%=id%>" style="font-size:12;color:04329C"><%=rs.getString("title")%></a></td>
<td bgcolor="E4EAF4"><%=rs.getString("type")%></td>
<td bgcolor="E4EAF4"><%=rs.getString("endtime")%></td>

</tr>
<%}%>
</table>
</body>
</html>
