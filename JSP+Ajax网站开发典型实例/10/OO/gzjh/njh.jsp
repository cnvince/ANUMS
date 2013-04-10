<%@ page contentType="text/html; charset=gb2312" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
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
   var url="njh1.jsp?page="+pagenum;
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
<p style="background:6C8ACC"><img src=guide.gif>工作计划&gt;&gt;个人计划&gt;&gt;年计划</p>
<a href="xinj.jsp" style="color:black;text-decoration:none"><img src="func_new.gif">新建计划</a>&nbsp;&nbsp;
<a href="yjh.jsp" style="color:black;text-decoration:none"><img src="func_list.gif">月计划</a>&nbsp;&nbsp;
<a href="jdh.jsp" style="color:black;text-decoration:none"><img src="func_list.gif">季度计划</a>&nbsp;&nbsp;
<a href="njh.jsp" style="color:black;text-decoration:none"><img src="func_list.gif">年计划</a>&nbsp;&nbsp;
<a href="xinj.jsp" style="color:black;text-decoration:none"><img src="func_return.gif">返回</a>&nbsp;&nbsp;
<div id=res></div>
<center>
<a  onclick="gg()" style="cursor:hand;color:04329C;font-size:12">上一页</a> 
<a  onclick="go()" style="cursor:hand;color:04329C;font-size:12">下一页</a>
</center>
