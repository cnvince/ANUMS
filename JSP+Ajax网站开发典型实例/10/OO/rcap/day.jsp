<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<html>
<head>
<title>
按天查看
</title>
<script src="ajax.js"></script>
<script type="text/javascript">
var pagenum=1;
function go(){
  pagenum=pagenum+1;
  validate()
}
function gg(){
  if(pagenum==1)
      pagenum=1;
  else
      pagenum=pagenum-1;
  validate()
}
var id;
function validate(){
   createXMLHttpRequest();
   var url="day1.jsp";
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
   var yan=xmlDoc.getElementsByTagName("content");
   var ta="<table width='100%' border='0' cellpadding='0' cellspacing='1' ><tr bgcolor='D0DCED'> <td width='30%'>主题</td><td width='10%'>开始时间</td><td width='10%'>结束时间</td><td width='10%' >种 类</td><td width='10%'>优先级</td><td width='10%' >完 成</td><td width='10%'>发布人</td></tr>";
      for(var i=0;i<yan.length;i++){
        var y=yan[i];
        ta+="<tr><td colspan=6></td></tr>";
          ta+="<tr bgcolor='E4EAF4'><td><a href='ric.jsp?id="+y.childNodes[0].firstChild.data+"'>"+y.childNodes[1].firstChild.data+"</a></td>";
	  ta+="<td>"+y.childNodes[2].firstChild.data+"</td>";
          ta+="<td>"+y.childNodes[3].firstChild.data+"</td>";
	  ta+="<td>"+y.childNodes[4].firstChild.data+"</td>";
          ta+="<td>"+y.childNodes[5].firstChild.data+"</td>";
          ta+="<td>"+y.childNodes[6].firstChild.data+"</td>";
          ta+="<td>"+y.childNodes[7].firstChild.data+"</td>";
         ta+="</tr>";
	 }
   ta+="</table>";
   document.getElementById("res").innerHTML=ta;
   //alert(yan.length);
}
</script>
<body topmargin="0" onload="validate()">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
    <td height="13" class="guide"> <img src="guide.gif"  align="absmiddle">
      日程安排&gt;&gt;一日日程&gt;&gt;
<%
   Calendar rightNow = Calendar.getInstance();
   rightNow.setTime(new java.util.Date());
   int year=rightNow.get(Calendar.YEAR);
   int month=rightNow.get(Calendar.MONTH)+1;
   int day=rightNow.get(Calendar.DAY_OF_MONTH);
   out.print(year+"年"+month+"月"+day+"号");
%>

</td>
  </tr>
</table>
<table border="0" cellpadding="0" cellspacing="8">
  <tr>

    <td class="whitebg">

      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
       
          <td height="23" align="center" valign="middle" class="bbg"> 
<img src="func_new.gif">
		<a href="xinj.jsp" style="color:black;text-decoration:none">新建事件</a>		  </td>
        </tr>
      </table>

    </td>
  </tr>
</table>
<div id="res"></div>


</body>
</html>