<%@ page contentType="text/html; charset=GB2312"  %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<html>
<head>
<title>
查看他人日程安排
</title>
</head>

<body topmargin="0">
<%
String id=request.getParameter("id");
int num=Integer.parseInt(id);
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor='6C8ACC'>
    <td height="13" class="guide"> <img src="guide.gif"  align="absmiddle">
	日程安排&gt;&gt;查看日程</td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="8" cellpadding="0">
  <tr>

    <td class="whitebg">

      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" >&nbsp;</td>
          <td height="23" align="center" valign="middle"> 

<img src="func_edit.gif" alt="修改事件"  border="0" align="absmiddle"><a href="xiugai.jsp?id=<%=id%>" style="color:black;text-decoration:none">修改事件</a> 
		  </td>
          <td width="4" height="24" align="right">&nbsp;</td>
        </tr>
      </table>

    </td>

    <td class="buttonbg">&nbsp;</td>
    <td width="50" align="center" valign="middle" class="tablebg"> <a  href="javascript:history.go(-1);" style="color:black;text-decoration:none"> 
      返回 </a></td>
    <td align="right" class="buttonbg">&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="1" cellspacing="1" >
<%

String sql="select * from oa_richeng where id="+num;
ResultSet rs=con.getRs(sql);
rs.next();
%>
  <tr> 
    <td width="15%" bgcolor='D0DCED'>标题</td>
    <td colspan="3" bgcolor='D0DCED'><%=rs.getString("zhuti")%></td>
  </tr>
  <tr> 
    <td width="15%" bgcolor='D0DCED'>开始时间</td>
    <td width="35%" bgcolor='D0DCED'>
	<%
	String starttime=rs.getString("starttime");
	String[] s1= starttime.split(" ");
	out.print(s1[0]); 
	%>
	</td>
    <td width="13%" bgcolor='D0DCED'>结束时间</td>
    <td width="37%" bgcolor='D0DCED'>
	<%
	String endtime=rs.getString("endtime");
	String[] s2= endtime.split(" ");
	out.print(s2[0]); 
	%>
	</td>
  </tr>

  <tr> 
    <td bgcolor='D0DCED'>类型</td>
    <td bgcolor='D0DCED'>
	<%=rs.getString("arrtype")%>
	</td>
	<td  bgcolor='D0DCED'>保密级别</td>
	
		<td bgcolor='D0DCED'><%=rs.getString("secret")%></td>
	
	
  </tr>
  <tr> 
    <td width="15%" bgcolor='D0DCED'>优先级</td>
    <td bgcolor='D0DCED'><%=rs.getString("priority")%></td>
    <td bgcolor='D0DCED'>目前状态</td>
    <td bgcolor='D0DCED'><%=rs.getString("finish")%></td>
  </tr>
  <tr>
	<td width="15%" bgcolor='D0DCED'>提醒类型</td>
    <td colspan="3" bgcolor='D0DCED'><%=rs.getString("awake")%></td>
  </tr>
  
  <tr>
      <td width="15%" valign="middle" bgcolor='D0DCED'>内容</td>
      <td colspan="3" bgcolor='D0DCED'><table width="100%" border="0" cellspacing="1" cellpadding="1" height="80">
	  <tr>
	  <td valign="top" bgcolor='D0DCED'><%=rs.getString("content")%></td>
	  </tr>
	  </table></td>
    </tr>
	  <tr>
	<td bgcolor='D0DCED'>发布者</td>
    <td colspan="3" bgcolor='D0DCED'><%=rs.getString("cjr")%></td>
  </tr>
</table>

<br>

</body>
</html>
