<html><head>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
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
function validate(){
   createXMLHttpRequest();
   var url="lu1.jsp?page="+pagenum;
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(null);
}

function callback(){
   if(xmlHttp.readyState==4){
       show();    }
}
function show(){
   var xmlDoc=xmlHttp.responseXML;
   var yan=xmlDoc.getElementsByTagName("content");
   var ta="<table width='100%' border='0' cellpadding='0' cellspacing='1' ><tr bgcolor='DCE6F4'> <td width='30%'>����</td><td width='10%'>���</td><td width='10%'>�����</td><td width='10%' >����</td><td width='10%' >���ʱ��</td></tr>";
      for(var i=0;i<yan.length;i++){
        var y=yan[i];
        ta+="<tr><td colspan=6 bgcolor='E4EAF4'></td></tr>";
          ta+="<tr><td bgcolor='E4EAF4'><a href='xian.jsp?id="+y.childNodes[0].firstChild.data+"' style='font-size:12;color:04329C'>"+y.childNodes[1].firstChild.data+"</a></td>";
	  ta+="<td bgcolor='E4EAF4'>"+y.childNodes[2].firstChild.data+"</td>";
          ta+="<td bgcolor='E4EAF4'>"+y.childNodes[3].firstChild.data+"</td>";
	  ta+="<td bgcolor='E4EAF4'>"+y.childNodes[4].firstChild.data+"</td>";
	  ta+="<td bgcolor='E4EAF4'>"+y.childNodes[5].firstChild.data+"</td>";
         ta+="</tr>";
	 }
   ta+="</table>";
   document.getElementById("res").innerHTML=ta;
   //alert(yan.length);
}
</script>
</head>
<body onload="validate()">
<table border="0" width="100%" cellpadding="0" cellspacing="0" bgcolor="6C8ACC">
	<tr>
		<td height="13" class="guide"> <img src="guide.gif"  align="absmiddle">
			�������&gt;&gt;��ټ�¼
		</td>
    </tr>
</table>
<br><br>
<div id="res"></div>
<center>
<a  onclick="gg()" style="cursor:hand"><font color=blue>��һҳ</font></a> 
<a  onclick="go()" style="cursor:hand"><font color=blue>��һҳ</font></a>
</center>
</body>
</html>