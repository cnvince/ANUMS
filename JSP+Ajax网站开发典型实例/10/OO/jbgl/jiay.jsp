<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>

<html>
<head>
<title>�ѽ����Ĺ���</title>
</head>

<BODY topmargin="0">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td height="13" bgcolor="6C8ACC">
	<img src="guide.gif" align="absmiddle"> �Ӱ����&gt;&gt;�Ѵ����ļ�</td>
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

			<a href="jiad.jsp" style="color:black;text-decoration:none"> <img src="func_list.gif" border="0" align="absmiddle" alt="">�������ļ�</a>

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

			<a href="jiay.jsp" style="color:black;text-decoration:none"> <img src="func_list.gif" border="0" align="absmiddle" alt="">�Ѵ����ļ�</a>

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

			<a href="jcha.jsp" style="color:black;text-decoration:none"> <img src="func_search.gif" border="0" align="absmiddle" alt="">�Ѵ����ļ���ѯ</a>

		  </td>
          <td width="4" height="24" align="right" class="buttonbg">&nbsp;</td>
        </tr>
      </table>

    </td>

  </tr>
</table>

<table width="100%" border="0" cellpadding="1" cellspacing="1" class="maintable">
	<tr bgcolor="D0DCED">
		<td width="28%" class="head">��������</td>
		<td width="18%" class="head">�Ӱ���</td>
		<td width="20%" class="head">���ʱ��</td>
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
