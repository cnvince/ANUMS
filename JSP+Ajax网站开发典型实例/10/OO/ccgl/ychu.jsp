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
	<img src="guide.gif" align="absmiddle" bgcolor="6C8ACC"> 人事出差&gt;&gt;已处理文件</td>
  </tr>
</table>

<table border="0" cellspacing="8" cellpadding="0">
  <tr>
    <td class="whitebg">

      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" class="buttonbg">&nbsp;</td>
          <td height="23" align="center" valign="middle" class="bbg"> 
			<a href="chud.jsp" style="color:black;text-decoration:none"> <img src="func_list.gif" border="0" align="absmiddle" alt="">待处理文件</a>
		  </td>
          <td width="4" height="24" align="right" class="buttonbg">&nbsp;</td>
        </tr>
      </table>
    </td>
    <td class="whitebg">

      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" class="buttonbg">&nbsp;</td>
          <td height="23" align="center" valign="middle" class="bbg"> 

			<a href="ychu.jsp" style="color:black;text-decoration:none"> <img src="func_list.gif" border="0" align="absmiddle" alt="">已处理文件</a>

		  </td>
          <td width="4" height="24" align="right" >&nbsp;</td>
        </tr>
      </table>
    </td>
    <td class="whitebg">
      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" class="buttonbg">&nbsp;</td>
          <td height="23" align="center" valign="middle" class="bbg"> 
			<a href="cha2.jsp" style="color:black;text-decoration:none"><img src="func_search.gif" border="0" align="absmiddle" alt="">已处理文件查询</a>
		  </td>
          <td width="4" height="24" align="right" class="buttonbg">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="maintable">
	<tr>
		<td width="50%" bgcolor="DCE6F4">工作名称</td>
		<td width="15%" bgcolor="DCE6F4">出差人员</td>
		<td width="15%" bgcolor="DCE6F4">目的地</td>
		<td width="20%" bgcolor="DCE6F4">完成时间</td>
	</tr>
<%
String sql="select * from oa_chucai where ischu='1'";
ResultSet rs=con.getRs(sql);
while(rs.next()){
int id=rs.getInt("id");
%>
<tr >
<td bgcolor="E4EAF4"><a href="xian.jsp?id=<%=id%>" style="color:04329C;font-size:12"><%=rs.getString("title")%></a></td>
<td bgcolor="E4EAF4"><%=rs.getString("ccr")%></td>
<td bgcolor="E4EAF4"><%=rs.getString("mud")%></td>
<td bgcolor="E4EAF4"><%=rs.getString("yft")%></td>
</tr>
<%}%>
</table>
</body>
</html>
