<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>

<html>
<head>
<title>日志列表 </title>
<script src="ajax.js"></script>
<script type="text/javascript">
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
   var ta="<table width='100%' border='0' cellpadding='0' cellspacing='1' ><tr bgcolor='BCCEED'> <td width='30%'>标题</td><td width='10%' >日志时间</td><td width='10%'>填写人</td></tr>";
      for(var i=0;i<yan.length;i++){
        var y=yan[i];
        ta+="<tr><td colspan=6></td></tr>";
          ta+="<tr bgcolor='E4EAF4'><td><a href='rizx.jsp?id="+y.childNodes[0].firstChild.data+"' style='color:04329C;font-size:12'>"+y.childNodes[1].firstChild.data+"</a></td>";
	  ta+="<td>"+y.childNodes[2].firstChild.data+"</td>";
          ta+="<td>"+y.childNodes[3].firstChild.data+"</td>";
         ta+="</tr>";
	 }
   ta+="</table>";
   document.getElementById("res").innerHTML=ta;
   //alert(yan.length);
}
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" onload="validate()">
<table width="100%" border="0" cellpadding="0" cellspacing="0" >
  <tr bgcolor="6C8ACC">
<%
 Calendar Now = Calendar.getInstance();
   Now.setTime(new java.util.Date());
   int y=Now.get(Calendar.YEAR);
   int m=Now.get(Calendar.MONTH)+1;
   int d=Now.get(Calendar.DAY_OF_MONTH);
   String str=y+"-"+m+"-"+d;
%>
    <td class="guide"> <img src="guide.gif"  align="absmiddle">
      日志 &gt;&gt;<%=str%>日志列表&gt;&gt;
<%
String name=(String)session.getAttribute("name");
out.print(name);
%>
 </td>
	  <td align="right" >&nbsp;</td>
  </tr>
</table>



<table border="0" cellpadding="0" cellspacing="8">
  <tr>
    <td class="whitebg">

      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
      
          <td height="23" align="center" valign="middle"> <a href="xinj.jsp" style="color:black;text-decoration:none"><img src="func_new.gif" border="0" align="absmiddle">新建日志</a> 
          </td>
        </tr>
      </table>

    </td>
  </tr>
</table>
<div id="res"></div>

</body>
</html>
