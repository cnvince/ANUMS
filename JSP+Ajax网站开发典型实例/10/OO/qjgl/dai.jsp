<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>

<html>
<head>
<title>我当前的工作</title>
</head>
<BODY topmargin="0">
<%
  String sessionname=(String)session.getAttribute("name");
  String sqq="select gangw from oa_user where zhangh='"+sessionname+"'";
  ResultSet rss=con.getRs(sqq);
  rss.next();
  String gangw=rss.getString("gangw");
  if(gangw.equals("总经理") | gangw.equals("副总经理") | gangw.equals("主任") | gangw.equals("经理")){
%>
<table border="0" width="100%" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
    <td height="13" >
	<img src="guide.gif"  align="absmiddle"> 人事请假&gt;&gt;待处理记录</td>
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
			<a href="dai.jsp" style="color:black;text-decoration:none"> <img src="func_list.gif" border="0" align="absmiddle" alt="">待处理信息</a>
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

			<a href="yichu.jsp" style="color:black;text-decoration:none"> <img src="func_list.gif" border="0" align="absmiddle" alt="">已处理信息</a>

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
			<a href="cha2.jsp" style="color:black;text-decoration:none"> <img src="func_search.gif" border="0" align="absmiddle" alt="">已处理信息查询</a>
		  </td>
          <td width="4" height="24" align="right" class="buttonbg">&nbsp;</td>
        </tr>
      </table>

    </td>

  </tr>
</table>
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="maintable">
	<tr bgcolor="DCE6F4">
		<td width="39%">工作标题</td>
		<td width="17%">紧急程度</td>
		<td width="17%">创建时间</td>
		<td width="9%">操 作</td>
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
<td bgcolor="E4EAF4"><a href="shen.jsp?id=<%=id%>" style="font-size:12;color:04329C">审批</a></td>
</tr>
<%}%>
</table>
<%}else{%>
<p>你不具备此权限</p>
<%}%>
</body>
</html>
