<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>

<%
String id=request.getParameter("id");
int num=Integer.parseInt(id);
String sql="select * from oa_chucai where id="+num;
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
			<a href="javascript:history.go(-1);" style="color:black;text-decoration:none">
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
    <tr bgcolor="C2D6EC">
    <td width="11%" valign="middle" >����</td>
    <td valign="middle" colspan="3"  width="39%" ><%=rs.getString("title")%></td>
    </tr>
    <tr bgcolor="C2D6EC">
          <td width="11%" valign="middle" >�ܼ�</td>
	  <td width="39%" valign="middle" ><%=rs.getString("secret")%></td>
          <td width="11%" valign="middle">�����̶�</td>
	  <td width="39%" valign="middle" ><%=rs.getString("jinj")%></td>
  </tr>  
 	<tr bgcolor="C2D6EC">
		<td width="11%" >������Ա��</td>
		<td colspan="3"><%=rs.getString("ccr")%></td>
	</tr>
	<tr bgcolor="C2D6EC">
		<td valign="middle" width="11%" >
                 <div align="justify">Ŀ�ĵأ�</div></td>
		<td valign="middle" width="39%" ><%=rs.getString("mud")%></td>
	</tr>
	<tr bgcolor="C2D6EC">
		<td width="11%">����ʱ�䣺</td>
		<td width="39%"><%=rs.getString("cft")%></td>
		<td width="11%">Ԥ�Ʒ���ʱ�䣺</td>
		<td ><%=rs.getString("yft")%></td>
	</tr>
	<tr bgcolor="C2D6EC">
		<td valign="middle" width="11%" >
                 <div align="justify">�������ɣ�</div></td>
		<td valign="middle" width="39%" ><%=rs.getString("ccs")%></td>
	</tr>
       <tr bgcolor="C2D6EC">
           <%
                String ischu=rs.getString("ischu");
                if(ischu.equals("0")){
            %>
           <td width="11%">���������</td><td>���޴������</td>
           <%}
                 if(ischu.equals("1")){
                   String yijian=rs.getString("yijian");
            %>
                      <td width="11%">���������</td><td><%=yijian%></td>
           <%}%>
       </tr>
</table>
</body>
</html>

