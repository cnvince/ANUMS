<%@ page contentType="text/html; charset=GB2312" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<html>
<head>
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
   var wangc=document.getElementById("wangc").value;
   var url="renwx1.jsp?page="+pagenum+"&wangc="+wangc;
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
   var ta="<table border=0 width=95% align=center id=ta><tr bgcolor='D4E2F4'><th>任务标题</th><th>重要程度</th><th>紧急程度</th><th>进度</th><th>下发时间</th><th>完成时间</th><th>执行人</th></tr>";
      for(var i=0;i<yan.length;i++){
        var y=yan[i];
        ta+="<tr><td colspan=6></td></tr>";
          ta+="<tr><td bgcolor='E4EAF4'><a href='renwxc.jsp?id="+y.childNodes[0].firstChild.data+"' style='color:04329C'>"+y.childNodes[1].firstChild.data+"</a></td>";
	  ta+="<td bgcolor='E4EAF4'>"+y.childNodes[2].firstChild.data+"</td>";
          ta+="<td bgcolor='E4EAF4'>"+y.childNodes[3].firstChild.data+"</td>";
	  ta+="<td bgcolor='E4EAF4'>"+y.childNodes[4].firstChild.data+"%</td>";
          ta+="<td bgcolor='E4EAF4'>"+y.childNodes[5].firstChild.data+"</td>";
          ta+="<td bgcolor='E4EAF4'>"+y.childNodes[6].firstChild.data+"</td>";
	  ta+="<td bgcolor='E4EAF4'>"+y.childNodes[7].firstChild.data+"</td>";
         ta+="</tr>";
	 }
   ta+="</table>";
   document.getElementById("res").innerHTML=ta;
   //alert(yan.length);
}
</script>


</head>
<body topmargin="0" onload=validate()>
<%
String wangc1=request.getParameter("wangc");
%>
<input type=hidden id=wangc value=<%=wangc1%>>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
     <%
 if(wangc1.equals("'0'")){
%>

      <td width="86%" height="13" > <img src="guide.gif"  align="absmiddle">
	      &gt;&gt;我的任务&gt;&gt;未完成的任务

	  </td>
<%
}
if(wangc1.equals("'1'"))
{
%>
      <td width="86%" height="13" > <img src="guide.gif"  align="absmiddle">
	      &gt;&gt;我的任务&gt;&gt;完成的任务

	  </td>
<%}%>
      <td align="right" class="guide" >&nbsp;</td>
  </tr>
</table>
<table border="0" cellpadding="0" cellspacing="8">
  <tr>
       
	<td class="whitebg">
    	<table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
       <%
            String name=(String)session.getAttribute("name");
            String sql="select * from oa_user where zhangh='"+name+"'";
            ResultSet rs=con.getRs(sql);
            rs.next();
            String gangw=rs.getString("gangw"); 
            if(gangw.equals("总经理") | gangw.equals("副总经理") | gangw.equals("主任") | gangw.equals("经理")){          
        %>
          <td height="23" align="center" valign="middle" > <a href="renw.jsp" style="color:black;text-decoration:none" ><img src="func_new.gif"
		border="0" align="absmiddle">新建任务</a> </td>
<%}else{%>

    <td height="23" align="center" valign="middle" >  </td>
<%}%>

        </tr>
      </table>
    </td>	
		
  
   	<td class="whitebg">
    	<table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" class="buttonbg"></td>
          <td height="23" align="center" valign="middle" class="bbg"> 
		<a href="renwx.jsp?wangc='0'" style="color:black;text-decoration:none"><img src="func_list.gif" border="0" align="absmiddle">未完成的下发任务</a>
		</td>
        </tr>
      	</table>
   	</td>
	<td class="whitebg">
    	<table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" class="buttonbg"></td>
          <td height="23" align="center" valign="middle" class="bbg"> 
		<a href="renwx.jsp?wangc='1'" style="color:black;text-decoration:none"><img src="func_list.gif" border="0" align="absmiddle">已完成的下发任务</a>
		</td>
        </tr>
      </table>
    </td>	
     <td class="whitebg">

		 <table height="22" border="0" cellpadding="0" cellspacing="0">
		 <tr>
		  <td width="4" height="24" class="buttonbg"></td>
          <td height="23" align="center" valign="middle" class="bbg"> 
			<img src="func_return.gif" 	border="0" align="absmiddle"><a href="javascript:history.go(-1);" style="color:black;text-decoration:none">返回</a></td>
        </tr>
      </table>

    </td>	
  </tr>
</table>

<div id=res></div>
</body>
</html>
