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
  <tr>
    <td height="13" bgcolor="6C8ACC">
	<img src="guide.gif" align="absmiddle"> 加班管理&gt;&gt;已处理文件</td>
	<td align="right" class="guide" >&nbsp;</td>
  </tr>
</table>

<table border="0" cellspacing="8" cellpadding="0">
  <tr>
    <td class="whitebg">

      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" class="buttonbg">&nbsp;</td>
          <td height="23" align="center" valign="middle" class="bbg"> 

			<a href="jiad.jsp" style="color:black;text-decoration:none"> <img src="func_list.gif" border="0" align="absmiddle" alt="">待处理文件</a>

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

			<a href="jiay.jsp" style="color:black;text-decoration:none"> <img src="func_list.gif" border="0" align="absmiddle" alt="">已处理文件</a>

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

			<a href="jcha.jsp" style="color:black;text-decoration:none"> <img src="func_search.gif" border="0" align="absmiddle" alt="">已处理文件查询</a>

		  </td>
          <td width="4" height="24" align="right" class="buttonbg">&nbsp;</td>
        </tr>
      </table>

    </td>

  </tr>
</table>

<table width="100%" border="0" cellpadding="1" cellspacing="1" class="maintable">
	<tr bgcolor="D0DCED">
		<td width="28%" class="head">工作名称</td>
		<td width="18%" class="head">加班人</td>
		<td width="20%" class="head">完成时间</td>
	</tr>
<%
String sql="select * from oa_jiaban where ischu='1'";
ResultSet rs=con.getRs(sql);
while(rs.next()){
int id=rs.getInt("id");
%>
<tr bgcolor="E4EAF4">
<td><a href="xian.jsp?id=<%=id%>" style="color:04329C"><%=rs.getString("title")%></a></td>
<td><%=rs.getString("jiar")%></td>
<td><%=rs.getString("endtime")%></td>
</tr>
<%}%>
</table>

</body>
</html>
