<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<html>
<head>
<title>�Ӱ����</title>
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
         alert(xmlHttp.responseText);
         alert("�����ѱ�ɾ��");
         window.location.reload(); 
           }  
     }
}
</script>
</head>
<body topmargin="0">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td height="13" bgcolor="6C8ACC"> <img src="guide.gif"  align="absmiddle">
			�Ӱ����&gt;&gt;�ѽ��ļ�
		</td>
    </tr>
</table>

<table  border="0" cellpadding="0" cellspacing="8">
  <tr>
    <td class="whitebg">

      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" class="buttonbg">&nbsp;</td>
          <td height="23" align="center" valign="middle" class="bbg"> 

			<a href="jiax.jsp" style="text-decoration:none;color:black"> <img src="func_new.gif" border="0" align="absmiddle" alt="">�½��Ӱ�����</a>

		  </td>
          <td width="4" height="24" align="right" class="buttonbg">&nbsp;</td>
        </tr>
      </table>

    </td>
    <td class="whitebg">&nbsp;</td>
    <td class="whitebg">

      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" class="buttonbg">&nbsp;</td>
          <td height="23" align="center" valign="middle" class="bbg"> 

			<a href="jiac.jsp" style="text-decoration:none;color:black"> <img src="func_search.gif" border="0" align="absmiddle" alt="">�Ӱ��ѯ</a>

		  </td>
          <td width="4" height="24" align="right" class="buttonbg">&nbsp;</td>
        </tr>
      </table>

    </td>

  </tr>
</table>

<table width="100%" border="0" cellpadding="1" cellspacing="1" class="maintable">
	<tr bgcolor="C7D8ED">
		<td width="20%" class="head">�� ��</td>
		<td width="8%" class="head">�� ��</td>
		<td width="10%" class="head">�����̶�</td>
		<td width="20%" class="head">�Ӱ�ʱ��</td>
		<td width="8%" class="head">״ ̬</td>
		<td width="16%" class="head">�� ��</td>
	</tr>
<%
    String name=(String)session.getAttribute("name");
   String sql="select * from oa_jiaban where cjr='"+name+"'";
   ResultSet rs=con.getRs(sql); 
   while(rs.next()){
   int id=rs.getInt("id");
%>
<tr bgcolor="E4EAF4">
<td><a href="xian.jsp?id=<%=id%>" style="color:04329C;font-size:12"><%=rs.getString("title")%></a></td>
<td><%=rs.getString("sercet")%></td>
<td><%=rs.getString("jinj")%></td>
<td><%=rs.getString("starttime")%>��<%=rs.getString("endtime")%></td>
   <%
       String ss=rs.getString("ischu");
       String zhut="";
       if(ss.equals("0"))
        zhut="δ����";
       if(ss.equals("1"))
        zhut="�Ѵ���";
  %>
  <td><%=zhut%></td>
  <td><p id=<%=id%> onclick="Start(this)" style='color:04329C;cursor: pointer;font-size:12'><u>ɾ��</u></p></td>
</tr>
<%}%>
</table>
</body>
</html>
