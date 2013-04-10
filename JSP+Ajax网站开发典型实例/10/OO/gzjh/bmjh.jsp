<%@ page contentType="text/html; charset=GB2312" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
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
   var bm=document.getElementById("bm").value;
   var jih=document.getElementById("jih").value;
   var url="bmjh1.jsp?page="+pagenum+"&bm="+bm+"&jih="+jih;
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
   var ta="<table border=0 width=95% align=center id=ta><tr bgcolor='D0DCED'><th>名称</th><th>级别</th><th>状态</th><th>时间</th><th>操作</th></tr>";
      for(var i=0;i<yan.length;i++){
        var y=yan[i];
        ta+="<tr><td colspan=6></td></tr>";
          ta+="<tr><td bgcolor='E4EAF4'>"+y.childNodes[0].firstChild.data+"</td>";
	  ta+="<td bgcolor='E4EAF4'>"+y.childNodes[1].firstChild.data+"</td>";
          ta+="<td bgcolor='E4EAF4'>"+y.childNodes[2].firstChild.data+"</td>";
	  ta+="<td bgcolor='E4EAF4'>"+y.childNodes[3].firstChild.data+"</td>";
          ta+="<td bgcolor='E4EAF4'>"+y.childNodes[4].firstChild.data+"</td>";
         ta+="</tr>";
	 }
   ta+="</table>";
   document.getElementById("res").innerHTML=ta;
   //alert(yan.length);
}
</script>
<body onload=validate()>
<%
String strr=(String)session.getAttribute("name");
String sql="select * from oa_user where zhangh='"+strr+"'";
ResultSet rs=con.getRs(sql);
rs.next();
String bum=rs.getString("bum");
String bm=request.getParameter("bm");
String jih=request.getParameter("st");
%>
<input type=hidden name=bm id=bm value=<%=new String(bm.getBytes("iso-8859-1"))%>>
<input type=hidden name=jih id=jih value=<%=new String(jih.getBytes("iso-8859-1"))%>
%>
<p style="background:6C8ACC"><img src=guide.gif>工作计划&gt;&gt;<%=new String(bm.getBytes("iso-8859-1"))%>&gt;&gt;<%=new String(jih.getBytes("iso-8859-1"))%>
</p>

<a href="bmjh.jsp?bm='部门'&st='月计划'" style="color:black;text-decoration:none"><img src="func_list.gif">月计划</a>&nbsp;&nbsp;
<a href="bmjh.jsp?bm='部门'&st='季度计划'" style="color:black;text-decoration:none"><img src="func_list.gif">季度计划</a>&nbsp;&nbsp;
<a href="bmjh.jsp?bm='部门'&st='年计划'" style="color:black;text-decoration:none"><img src="func_list.gif">年计划</a>&nbsp;&nbsp;
<a href="xinj.jsp" style="color:black;text-decoration:none"><img src="func_return.gif" >新建计划</a>&nbsp;&nbsp;
<select><option><%=bum%></option></select>
<br><br>
<div id=res></div>
<center>
<a  onclick="gg()" style="cursor:hand;color:04329C">上一页</a> 
<a  onclick="go()" style="cursor:hand;color:04329C">下一页</a>
</center>
