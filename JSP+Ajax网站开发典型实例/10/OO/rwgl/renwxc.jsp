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
        document.getElementById("showdata").innerHTML="<span style='font-size:20;color:red'>查询记录不存在</span>";
      }
   else{
   var ta="<table width='100%' border='0' cellpadding='1' cellspacing='1'>";
   for(var i=0;i<content.length;i++){
      var y=content[i]; 
        ta+="<tr><td width='11%' bgcolor='C2D6EC'>任务主题 </td><td colspan='3' bgcolor='E4EAF4'>"+y.childNodes[0].firstChild.data+"</td></tr>";
	ta+="<tr><td width='11%' bgcolor='C2D6EC'>重要程度</td><td width='39%' bgcolor='E4EAF4'>"+y.childNodes[1].firstChild.data+"</td>";
	ta+="<td width='11%' bgcolor='C2D6EC'>紧急程度</td><td width='39%' bgcolor='E4EAF4'>"+y.childNodes[2].firstChild.data+"</td></tr>";
	ta+="<td width='11%' bgcolor='C2D6EC'>进度</td><td width='39%' bgcolor='E4EAF4'>"+y.childNodes[3].firstChild.data+"%</td>";
	ta+="<td width='11%' bgcolor='C2D6EC'>下发人</td><td width='39%' bgcolor='E4EAF4'>"+y.childNodes[4].firstChild.data+"</td>";
        ta+="<tr><td width='11%' bgcolor='C2D6EC'>执行人</td><td width='39%' bgcolor='E4EAF4'>"+y.childNodes[5].firstChild.data+"</td>"; 
        ta+="<td width='11%' bgcolor='C2D6EC'>参与人</td><td width='39%' bgcolor='E4EAF4'>"+y.childNodes[6].firstChild.data+"</td></tr>";
        ta+="<tr><td width='11%' bgcolor='C2D6EC'>下发时间</td><td width='39%' bgcolor='E4EAF4'>"+y.childNodes[7].firstChild.data+"</td>";
        ta+="<td width='11%' bgcolor='C2D6EC'>要求完成时间</td><td width='39%' bgcolor='E4EAF4'>"+y.childNodes[8].firstChild.data+"</td></tr>";
        ta+="<tr><td width='11%' valign='middle' height='50' bgcolor='C2D6EC' bgcolor='E4EAF4' bgcolor='E4EAF4'>任务内容</td><td colspan='3' height='50' bgcolor='E4EAF4'>"+y.childNodes[9].firstChild.data+"</td> </tr>";
        ta+="<td  bgcolor='C2D6EC'>附件</td><td colspan='3' bgcolor='E4EAF4'>"+y.childNodes[10].firstChild.data+"</td></tr>";
        ta+="<tr><td width='9%' bgcolor='C2D6EC'>关联</td><td width='91%' colspan='3' bgcolor='E4EAF4'>"+y.childNodes[11].firstChild.data+"</td></tr>";
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
	&gt;&gt;我的任务&gt;&gt;任务原文
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
			<a href="yijian.jsp?id=<%=id%>" style="color:black;text-decoration:none"><img src="func_new.gif" border="0" align="absmiddle">新建意见</a>
        </tr>
	</table>
	</td>
<td class="whitebg">
<table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" >&nbsp;</td>
          <td height="23" align="center" valign="middle" > 
		
         <a href="renw.jsp"  target="content" style="color:black;text-decoration:none"><img src="func_new.gif" border="0" align="absmiddle">新建子任务</a>
		  <td width="4" height="24" align="right" >&nbsp;</td>
        </tr>
</table>
</td>
<td class="whitebg">
    	<table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" >&nbsp;</td>
          <td height="23" align="center" valign="middle">
	        <a href="javascript:history.go(-1);" target="content"  style="color:black;text-decoration:none"><img src="func_return.gif" border="0" align="absmiddle">返回</a>
	<td width="4" height="24" align="right" >&nbsp;</td>
        </tr>
	</table>
	</td>	
	
  </tr>
</table>
<div id="showdata"> </div>
  <p style="font-size:15;">进度报告</p>
  <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" >
 <tr  bgcolor="C2D6EC">
    <td width="40%" >进度简述</td>
    <td width="10%" >任务进度</td>
	<td width="10%" >填写人</td>
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
  <p>意见说明</p>
  <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" >
  <tr bgcolor="C2D6EC">
    <td width="40%" >内容</td>
    <td width="10%" >填写时间</td>
	<td width="10%" >填写人</td>
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
