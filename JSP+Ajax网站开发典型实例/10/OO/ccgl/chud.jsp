<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>

<html>
<head>
<title>我当前的工作</title>
</head>
<BODY topmargin="0">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC"> 
    <td height="13" >
	<img src="guide.gif"  align="absmiddle"> 人事出差&gt;&gt;待处理文件</td>
  </tr>
</table>
<table border="0" cellspacing="8" cellpadding="0">
  <tr>
    <td >
      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" >&nbsp;</td>
          <td height="23" align="center" valign="middle"> 
			<a href="chud.jsp" style="color:black;text-decoration:none"> <img src="func_list.gif" border="0" align="absmiddle" alt="">待处理文件</a>
		  </td>
          <td width="4" height="24" align="right" >&nbsp;</td>
        </tr>
      </table>
    </td>

    <td class="whitebg">
      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" >&nbsp;</td>
          <td height="23" align="center" valign="middle"> 

			<a href="ychu.jsp" style="color:black;text-decoration:none"> <img src="func_list.gif" border="0" align="absmiddle" alt="">已处理文件</a>

		  </td>
          <td width="4" height="24" align="right" >&nbsp;</td>
        </tr>
      </table>

    </td>

    <td class="whitebg">

      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24">&nbsp;</td>
          <td height="23" align="center" valign="middle" > 

			<a href="cha2.jsp" style="color:black;text-decoration:none"> <img src="func_search.gif" border="0" align="absmiddle" alt="">已处理文件查询</a>

		  </td>
          <td width="4" height="24" align="right" >&nbsp;</td>
        </tr>
      </table>

    </td>

  </tr>
</table>
<table width="100%" border="0" cellpadding="1" cellspacing="1" >
	<tr>
		<td width="39%" bgcolor="D4E2F4">工作标题</td>
		<td width="17%" bgcolor="D4E2F4">紧急程度</td>
		<td width="17%" bgcolor="D4E2F4">创建时间</td>
		<td width="9%" bgcolor="D4E2F4">操 作</td>
	</tr>
<%
String sql="select * from oa_chucai where ischu='0'";
ResultSet rs=con.getRs(sql);
while(rs.next()){
int id=rs.getInt("id");
%>
<tr>
<td bgcolor="E4EAF4"><a href="xian.jsp?id=<%=id%>" style="color:04329C;font-size:12"><%=rs.getString("title")%></a></td>
<td bgcolor="E4EAF4"><%=rs.getString("jinj")%></td>
<td bgcolor="E4EAF4"><%=rs.getString("ctt")%></td>
<td bgcolor="E4EAF4"><a href="shen.jsp?id=<%=id%>" style="color:04329C">审批</a></td>
</tr>
<%}%>
</table>
</body>
</html>
