<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<html>
<head>
<title>文件信息</title>
</head>
<BODY topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="13" bgcolor="6C8ACC">
	<img src="guide.gif" align="absmiddle"> 加班管理&gt;&gt;文件信息</td>
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
			<img src="func_return.gif" alt="返回" width="16" height="16" border="0" align="absmiddle">返回</a></td>
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
    <td width="11%" valign="middle" >标题</td>
    <td valign="middle" colspan="3" width="39%" ><%=rs.getString("title")%></td>
    </tr>
    <tr bgcolor="E4EAF4">
    <td width="11%" valign="middle" >密级</td>
		<td width="39%" valign="middle" ><%=rs.getString("sercet")%></td>
    <td width="11%" valign="middle">紧急程度</td>
		<td width="39%" valign="middle"><%=rs.getString("jinj")%></td>
  </tr>  
 	<tr bgcolor="E4EAF4">
	    <td width="11%" > 加班处室</td>
		<td width="39%"><%=rs.getString("jiac")%></td>
		<td width="11%"> 负责人</td>
		<td width="39%"><%=rs.getString("fzr")%></td>
  </tr>
	  <tr bgcolor="E4EAF4">
	     <td >加班事由</td>
		 <td colspan="3" ><%=rs.getString("jias")%></td> 
	 </tr>
	  
	<tr bgcolor="E4EAF4"> 
	  <td width="11%"> 加班人姓名</td>
	  <td width="39%"><%=rs.getString("jiar")%></td>
		<td width="11%">加班地点</td>
		<td width="39%" valign="middle"><%=rs.getString("jiad")%></td>
	</tr>
	<tr bgcolor="E4EAF4"> 
		<td width="11%" >加班起始时间</td>
		<td width="39%"><%=rs.getString("starttime")%></td>
		<td width="11%">加班结束时间</td>
		 <td width="39%"><%=rs.getString("endtime")%></td>
	</tr>
	<tr bgcolor="E4EAF4">
	    <td width="11%"> 是否法定假日</td>
		<td width="39%"><%=rs.getString("fad")%></td>
	    <td width="11%"> 处理意见</td>
		<td width="39%"><%=rs.getString("yijian")%></td>
  </tr>
</table>
</tr>
</table>
</body>
</html>
