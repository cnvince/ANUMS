<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<html>
<head>
<title>�ļ���Ϣ</title>
</head>
<BODY topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="13" bgcolor="6C8ACC">
	<img src="guide.gif" align="absmiddle"> �Ӱ����&gt;&gt;�ļ���Ϣ</td>
  </tr>
</table>
<table border="0" cellspacing="8" cellpadding="0">
  <tr>
    <td>
      	<table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" align="right" >&nbsp;</td>
        </tr>
      </table>
    </td>
    <td>
      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24">&nbsp;</td>
          <td height="24" align="center" valign="middle" > 
			<a href="javascript:history.go(-1);" style="color:black;text-decoration:none">
			<img src="func_return.gif" alt="����" width="16" height="16" border="0" align="absmiddle">����</a></td>
        </tr>
      </table>
    </td>
</tr></table>
<table width="100%" border="0" cellpadding="1" cellspacing="1" >
<%
String id=request.getParameter("id");
int num=Integer.parseInt(id);
String sql="select * from oa_jiaban where id="+num;
ResultSet rs=con.getRs(sql);
rs.next();
%>

    <tr bgcolor="E4EAF4">
    <td width="11%" valign="middle" >����</td>
    <td valign="middle" colspan="3" width="39%" ><%=rs.getString("title")%></td>
    </tr>
    <tr bgcolor="E4EAF4">
    <td width="11%" valign="middle" >�ܼ�</td>
		<td width="39%" valign="middle" ><%=rs.getString("sercet")%></td>
    <td width="11%" valign="middle">�����̶�</td>
		<td width="39%" valign="middle"><%=rs.getString("jinj")%></td>
  </tr>  
 	<tr bgcolor="E4EAF4">
	    <td width="11%" > �Ӱദ��</td>
		<td width="39%"><%=rs.getString("jiac")%></td>
		<td width="11%"> ������</td>
		<td width="39%"><%=rs.getString("fzr")%></td>
  </tr>
	  <tr bgcolor="E4EAF4">
	     <td >�Ӱ�����</td>
		 <td colspan="3" ><%=rs.getString("jias")%></td> 
	 </tr>
	  
	<tr bgcolor="E4EAF4"> 
	  <td width="11%"> �Ӱ�������</td>
	  <td width="39%"><%=rs.getString("jiar")%></td>
		<td width="11%">�Ӱ�ص�</td>
		<td width="39%" valign="middle"><%=rs.getString("jiad")%></td>
	</tr>
	<tr bgcolor="E4EAF4"> 
		<td width="11%" >�Ӱ���ʼʱ��</td>
		<td width="39%"><%=rs.getString("starttime")%></td>
		<td width="11%">�Ӱ����ʱ��</td>
		 <td width="39%"><%=rs.getString("endtime")%></td>
	</tr>
	<tr bgcolor="E4EAF4">
	    <td width="11%"> �Ƿ񷨶�����</td>
		<td width="39%"><%=rs.getString("fad")%></td>
	    <td width="11%"> �������</td>
		<td width="39%"><%=rs.getString("yijian")%></td>
  </tr>
</table>
</tr>
</table>
</body>
</html>
