<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>

<html>
<head>
<title>�ҵ�ǰ�Ĺ���</title>
</head>
<BODY topmargin="0">
<%
  String sessionname=(String)session.getAttribute("name");
  String sqq="select gangw from oa_user where zhangh='"+sessionname+"'";
  ResultSet rss=con.getRs(sqq);
  rss.next();
  String gangw=rss.getString("gangw");
  if(gangw.equals("�ܾ���") | gangw.equals("���ܾ���") | gangw.equals("����") | gangw.equals("����")){
%>
<table border="0" width="100%" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
    <td height="13" >
	<img src="guide.gif"  align="absmiddle"> �������&gt;&gt;�������¼</td>
	<td align="right" >&nbsp;</td>
  </tr>
</table>
<table border="0" cellspacing="8" cellpadding="0">
  <tr>
    <td >
      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" >&nbsp;</td>
          <td height="23" align="center" valign="middle" class="bbg"> 
			<a href="dai.jsp" style="color:black;text-decoration:none"> <img src="func_list.gif" border="0" align="absmiddle" alt="">��������Ϣ</a>
		  </td>
          <td width="4" height="24" align="right" class="buttonbg">&nbsp;</td>
        </tr>
      </table>
    </td>
    <td class="whitebg">
      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" >&nbsp;</td>
          <td height="23" align="center" valign="middle" > 

			<a href="yichu.jsp" style="color:black;text-decoration:none"> <img src="func_list.gif" border="0" align="absmiddle" alt="">�Ѵ�����Ϣ</a>

		  </td>
          <td width="4" height="24" align="right">&nbsp;</td>
        </tr>
      </table>
    </td>
    <td class="whitebg">
      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" >&nbsp;</td>
          <td height="23" align="center" valign="middle"> 
			<a href="cha2.jsp" style="color:black;text-decoration:none"> <img src="func_search.gif" border="0" align="absmiddle" alt="">�Ѵ�����Ϣ��ѯ</a>
		  </td>
          <td width="4" height="24" align="right" class="buttonbg">&nbsp;</td>
        </tr>
      </table>

    </td>

  </tr>
</table>
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="maintable">
	<tr bgcolor="DCE6F4">
		<td width="39%">��������</td>
		<td width="17%">�����̶�</td>
		<td width="17%">����ʱ��</td>
		<td width="9%">�� ��</td>
	</tr>
	
<%
String sql="select * from oa_qingjia where ischu='0'";
ResultSet rs=con.getRs(sql);
while(rs.next()){
int id=rs.getInt("id");
%>
<tr>
<td bgcolor="E4EAF4"><a href="xian.jsp?id=<%=id%>" style="font-size:12;color:04329C"><%=rs.getString("title")%></a></td>
<td bgcolor="E4EAF4"><%=rs.getString("jinj")%></td>
<td bgcolor="E4EAF4"><%=rs.getString("qjt")%></td>
<td bgcolor="E4EAF4"><a href="shen.jsp?id=<%=id%>" style="font-size:12;color:04329C">����</a></td>
</tr>
<%}%>
</table>
<%}else{%>
<p>�㲻�߱���Ȩ��</p>
<%}%>
</body>
</html>
