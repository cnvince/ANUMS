<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<html>
<head>
<title>人事出差</title>
<script src="ajax.js"></script>
<script type="text/javascript">
function Start(ele){
  id=ele.id;
  createXMLHttpRequest();
  var url="del.jsp?key="+escape(ele.id);
  xmlHttp.open("GET",url,true);
  xmlHttp.onreadystatechange=Del;
  xmlHttp.send(null);
}
function Del(){
   if(xmlHttp.readyState==4){
       if(xmlHttp.responseText==1){
         alert("该项已被删除");
         window.location.reload(); 
           }  
     }
}
</script>
</head>

<body topmargin="0">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr bgcolor="6C8ACC">
		<td height="13"> <img src="guide.gif"  align="absmiddle">
			人事出差&gt;&gt;数据创建
		</td>
		<td align="right">&nbsp;</td>
    </tr>
</table>

<table  border="0" cellpadding="0" cellspacing="8">
  <tr>
    <td >

      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" >&nbsp;</td>
          <td height="23" align="center" valign="middle" > 

			<a href="tian.jsp" style="color:black;text-decoration:none"> <img src="func_new.gif" border="0" align="absmiddle" alt="">出差填写</a>

		  </td>
          <td width="4" height="24" align="right" >&nbsp;</td>
        </tr>
      </table>

    </td>
    <td>&nbsp;</td>
    <td>

      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24">&nbsp;</td>
          <td height="23" align="center" valign="middle"> 

			<a href="cha.jsp" style="color:black;text-decoration:none"> <img src="func_search.gif" border="0" align="absmiddle" alt="">出差记录查询</a>

		  </td>
          <td width="4" height="24" align="right" >&nbsp;</td>
        </tr>
      </table>

    </td>

  </tr>
</table>

<table width="100%" border="0" cellpadding="1" cellspacing="1" >
	<tr >
		<td width="38%" bgcolor="D4E2F4">名 称</td>
		<td width="8%"  bgcolor="D4E2F4">密 级</td>
		<td width="10%" bgcolor="D4E2F4">紧急程度</td>
		<td width="8%"  bgcolor="D4E2F4">状 态</td>
		<td width="20%" bgcolor="D4E2F4">申请时间</td>
		<td width="16%" bgcolor="D4E2F4">操 作</td>
	</tr>
<%
String name=(String)session.getAttribute("name");
String sql="select * from oa_chucai where ctr='"+name+"'";
ResultSet rs=con.getRs(sql); 
while(rs.next()){
int id=rs.getInt("id");
%>
 <td bgcolor="E4EAF4"><a href="xian.jsp?id=<%=id%>" style="color:04329C;font-size:12"><%=rs.getString("title")%></a></td>
  <td bgcolor="E4EAF4"><%=rs.getString("secret")%></td>
  <td bgcolor="E4EAF4"><%=rs.getString("jinj")%></td>
   <%
       String ss=rs.getString("ischu");
       String zhut="";
       if(ss.equals("0"))
        zhut="未处理";
       if(ss.equals("1"))
        zhut="已处理";
  %>
  <td bgcolor="E4EAF4"><%=zhut%></td>
  <td bgcolor="E4EAF4"><%=rs.getString("ctt")%></td>
  <td bgcolor="E4EAF4"><p id=<%=id%> onclick="Start(this)" style='color:04329C;cursor:pointer;'><u>删除</u></p></td>
</tr>  
<%
}
rs.close();
%>    
</table>

</body>
</html>
