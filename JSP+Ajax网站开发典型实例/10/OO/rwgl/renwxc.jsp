<%@ page contentType="text/html; charset=GB2312" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<html>
<head>
<script src="ajax.js"></script>
<script type="text/javascript">
function getD(){
  var id1=document.getElementById("id").value;
  createXMLHttpRequest();
  var url="jind1.jsp?id="+id1;
   xmlHttp.open("GET",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.send(null); 
}
function callback(){
   if(xmlHttp.readyState==4){
        show();
	  }
}
function show(){
   var xmlDoc=xmlHttp.responseXML;
   var content=xmlDoc.getElementsByTagName("content");
   var num=0;
   if(content.length==0){
        document.getElementById("showdata").innerHTML="<span style='font-size:20;color:red'>��ѯ��¼������</span>";
      }
   else{
   var ta="<table width='100%' border='0' cellpadding='1' cellspacing='1'>";
   for(var i=0;i<content.length;i++){
      var y=content[i]; 
        ta+="<tr><td width='11%' bgcolor='C2D6EC'>�������� </td><td colspan='3' bgcolor='E4EAF4'>"+y.childNodes[0].firstChild.data+"</td></tr>";
	ta+="<tr><td width='11%' bgcolor='C2D6EC'>��Ҫ�̶�</td><td width='39%' bgcolor='E4EAF4'>"+y.childNodes[1].firstChild.data+"</td>";
	ta+="<td width='11%' bgcolor='C2D6EC'>�����̶�</td><td width='39%' bgcolor='E4EAF4'>"+y.childNodes[2].firstChild.data+"</td></tr>";
	ta+="<td width='11%' bgcolor='C2D6EC'>����</td><td width='39%' bgcolor='E4EAF4'>"+y.childNodes[3].firstChild.data+"%</td>";
	ta+="<td width='11%' bgcolor='C2D6EC'>�·���</td><td width='39%' bgcolor='E4EAF4'>"+y.childNodes[4].firstChild.data+"</td>";
        ta+="<tr><td width='11%' bgcolor='C2D6EC'>ִ����</td><td width='39%' bgcolor='E4EAF4'>"+y.childNodes[5].firstChild.data+"</td>"; 
        ta+="<td width='11%' bgcolor='C2D6EC'>������</td><td width='39%' bgcolor='E4EAF4'>"+y.childNodes[6].firstChild.data+"</td></tr>";
        ta+="<tr><td width='11%' bgcolor='C2D6EC'>�·�ʱ��</td><td width='39%' bgcolor='E4EAF4'>"+y.childNodes[7].firstChild.data+"</td>";
        ta+="<td width='11%' bgcolor='C2D6EC'>Ҫ�����ʱ��</td><td width='39%' bgcolor='E4EAF4'>"+y.childNodes[8].firstChild.data+"</td></tr>";
        ta+="<tr><td width='11%' valign='middle' height='50' bgcolor='C2D6EC' bgcolor='E4EAF4' bgcolor='E4EAF4'>��������</td><td colspan='3' height='50' bgcolor='E4EAF4'>"+y.childNodes[9].firstChild.data+"</td> </tr>";
        ta+="<td  bgcolor='C2D6EC'>����</td><td colspan='3' bgcolor='E4EAF4'>"+y.childNodes[10].firstChild.data+"</td></tr>";
        ta+="<tr><td width='9%' bgcolor='C2D6EC'>����</td><td width='91%' colspan='3' bgcolor='E4EAF4'>"+y.childNodes[11].firstChild.data+"</td></tr>";
   }
   ta+="</table>";
   document.getElementById("showdata").innerHTML=ta;
  }
}
</script>
</head>
<body topmargin="0" onload="getD()">
<%
String id=request.getParameter("id");
%>
<input type=hidden id="id" value=<%=id%>>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor='6C8ACC'>
    <td height="13" > <img src="guide.gif"  align="absmiddle">
	&gt;&gt;�ҵ�����&gt;&gt;����ԭ��
	</td>
  </tr>
</table>
<table border="0" cellpadding="0" cellspacing="8">
  <tr>
	
<td >
    <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" >&nbsp;</td>
          <td height="23" align="center" valign="middle" > 
			<a href="yijian.jsp?id=<%=id%>" style="color:black;text-decoration:none"><img src="func_new.gif" border="0" align="absmiddle">�½����</a>
        </tr>
	</table>
	</td>
<td class="whitebg">
<table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" >&nbsp;</td>
          <td height="23" align="center" valign="middle" > 
		
         <a href="renw.jsp"  target="content" style="color:black;text-decoration:none"><img src="func_new.gif" border="0" align="absmiddle">�½�������</a>
		  <td width="4" height="24" align="right" >&nbsp;</td>
        </tr>
</table>
</td>
<td class="whitebg">
    	<table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" >&nbsp;</td>
          <td height="23" align="center" valign="middle">
	        <a href="javascript:history.go(-1);" target="content"  style="color:black;text-decoration:none"><img src="func_return.gif" border="0" align="absmiddle">����</a>
	<td width="4" height="24" align="right" >&nbsp;</td>
        </tr>
	</table>
	</td>	
	
  </tr>
</table>
<div id="showdata"> </div>
  <p style="font-size:15;">���ȱ���</p>
  <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" >
 <tr  bgcolor="C2D6EC">
    <td width="40%" >���ȼ���</td>
    <td width="10%" >�������</td>
	<td width="10%" >��д��</td>
  </tr>
<%
  String ssq="select * from renwu_jind where renwu_id='"+id+"'";
  ResultSet rs=con.getRs(ssq);
 while(rs.next()){
       String jindu=rs.getString("jindu");
       String jians=rs.getString("jians");
       String  jinr=rs.getString("jinr");
       out.print("<tr><td bgcolor='E4EAF4'>"+jians+"</td><td bgcolor='E4EAF4'>"+jindu+"%</td><td bgcolor='E4EAF4'>"+jinr+"</td></tr>");  
  }
%>
</table>
  <p>���˵��</p>
  <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" >
  <tr bgcolor="C2D6EC">
    <td width="40%" >����</td>
    <td width="10%" >��дʱ��</td>
	<td width="10%" >��д��</td>
  </tr>
<%
  String sq="select * from renwu_yijian where renw_id='"+id+"'";
  ResultSet rss=con.getRs(sq);
 while(rss.next()){
       String yijian=rss.getString("yijian");
       String yijt=rss.getString("yijt");
       String  yijr=rss.getString("yijr");
       out.print("<tr><td bgcolor='E4EAF4'>"+yijian+"</td><td bgcolor='E4EAF4'>"+yijt+"%</td><td bgcolor='E4EAF4'>"+yijr+"</td></tr>");  
  }
%>
</table>
</body>
</html>
