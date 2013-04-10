<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<HTML>
<HEAD>
<TITLE>用户基本/系统信息</TITLE>
</HEAD>
<body topmargin="0">
<%
 String name=(String)session.getAttribute("name");
 String sql="select * from oa_user where zhangh='"+name+"'";
 ResultSet rs=con.getRs(sql);
 rs.next();
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr bgcolor="6C8ACC">
		<td ><img src="guide.gif" align="absmiddle">
		个人设置&gt;&gt;个人基本信息</td>
		<td align="right" >&nbsp;</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="1" cellspacing="1">
	<tr bgcolor="E4EAF4">
		<td colspan="10" >&nbsp;</td>
	</tr>

	<tr bgcolor="E4EAF4">
		<td width="11%" >账号</td>
		<td width="39%" ><%=rs.getString("zhangh")%></td>
		
		<td width="11%" >姓名</td>
		<td width="39%" ><%=rs.getString("name")%></td>
	</tr>
	
	<tr bgcolor="E4EAF4">
	    <td width="11%" >昵称</td>
        <td width="39%" ><%=rs.getString("nic")%></td> 
             
		<td width="11%" >岗位</td>
		<td width="39%" ><%=rs.getString("gangw")%></td>
	</tr>
	
	<tr bgcolor="E4EAF4">
		<td width="11%" >部门</td>
		<td width="39%" ><%=rs.getString("bum")%></td>

		<td width="11%" >电子邮件</td>
		<td width="39%" ><%=rs.getString("mail")%></td>
	</tr>
	
	<tr bgcolor="E4EAF4">
		<td width="11%" >手机</td>
		<td width="39%" ><%=rs.getString("shouj")%></td>

		<td width="11%" >办公电话</td>
		<td width="39%" ><%=rs.getString("gphone")%></td>
	</tr>
	
	<tr bgcolor="E4EAF4">
		<td width="11%" >家庭地址</td>
		<td width="39%" ><%=rs.getString("jzhu")%></td>
		<td width="11%" >登录IP</td>
		<td width="39%" ><%=rs.getString("ip")%></td>
	</tr>
	<tr bgcolor="E4EAF4">

		<td width="11%" >登录次数</td>
		<td width="39%" ><%=rs.getString("cishu")%>次</td>
		<td width="11%" >上一次登录时间</td>
		<td colspan="3" width="39%" ><%=rs.getString("dtime")%></td>
	</tr>
</table>
</BODY>
</HTML>
