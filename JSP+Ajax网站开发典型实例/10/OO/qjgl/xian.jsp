<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>

<%
String id=request.getParameter("id");
int num=Integer.parseInt(id);
String sql="select * from oa_qingjia where id="+num;
ResultSet rs=con.getRs(sql);
rs.next();
%>
<html>
<head>
<title>�ļ���Ϣ</title>
</head>
<BODY topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
    <td height="13" class="guide">
	<img src="guide.gif" align="absmiddle"> �������&gt;&gt;�ļ���Ϣ</td>
  </tr>
</table>
<table border="0" cellspacing="8" cellpadding="0">
  <tr>
    <td class="whitebg">&nbsp;</td>
    <td class="whitebg">
      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" >&nbsp;</td>
          <td height="23" align="center" valign="middle" class="bbg"> 
			<a href="javascript:history.go(-1);" style="color:black;text-decoration:none;">
			<img src="func_return.gif" alt="����" width="16" height="16" border="0" align="absmiddle">����
			</a>

		  </td>
          <td width="4" height="24" align="right" >&nbsp;</td>
        </tr>
      </table>

    </td>
	
  </tr>
</table>
<table width="100%" border="0" cellpadding="1" cellspacing="1">
    <tr>
    <td width="11%" valign="middle" bgcolor="C2D6EC">����</td>
    <td valign="middle" colspan="3"  width="39%" bgcolor="C2D6EC"><%=rs.getString("title")%></td>
    </tr>
    <tr>
          <td width="11%" valign="middle" bgcolor="C2D6EC">�ܼ�</td>
	  <td width="39%" valign="middle" bgcolor="C2D6EC"><%=rs.getString("secret")%></td>
          <td width="11%" valign="middle" bgcolor="C2D6EC">�����̶�</td>
	  <td width="39%" valign="middle" bgcolor="C2D6EC"><%=rs.getString("jinj")%></td>
  </tr>  
 	<tr>
		<td width="11%" bgcolor="C2D6EC">���</td>
		<td colspan="3" bgcolor="C2D6EC"><%=rs.getString("type")%></td>
	</tr>
	<tr>
		<td valign="middle" width="11%" bgcolor="C2D6EC">
                 <div align="justify" >����ˣ�</div></td>
		<td valign="middle" width="39%" bgcolor="C2D6EC"><%=rs.getString("qjr")%></td>
		<td align="right" valign="middle" width="11%" bgcolor="C2D6EC">
                 <div align="justify">���ڲ��ţ�</div></td>
		<td valign="middle" bgcolor="C2D6EC"><%=rs.getString("bum")%></td>
	</tr>
	<tr>
		<td width="11%" bgcolor="C2D6EC">��ʼʱ�䣺</td>
		<td width="39%" bgcolor="C2D6EC"><%=rs.getString("starttime")%></td>
		<td width="11%" bgcolor="C2D6EC">����ʱ�䣺</td>
		<td bgcolor="C2D6EC"><%=rs.getString("endtime")%></td>
	</tr>
       <tr>
           <%
                String ischu=rs.getString("ischu");
                if(ischu.equals("0")){
            %>
           <td width="11%" bgcolor="C2D6EC">���������</td><td bgcolor="C2D6EC">���޴������</td>
           <%}
                 if(ischu.equals("1")){
                   String chuyi=rs.getString("chuyi");
            %>
                      <td width="11%" bgcolor="C2D6EC">���������</td><td bgcolor="C2D6EC"><%=chuyi%></td>
           <%}%>
       </tr>
</table>
</body>
</html>

