<html>
<head>
<title>�Ӱ����</title>
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
   var url="jilu1.jsp?page="+pagenum;
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
   var ta="<table width='100%' border='0' cellpadding='0' cellspacing='1' ><tr bgcolor='6C8ACC'> <td width='30%'>�Ӱ����</td><td width='10%'>�Ӱ���</td><td width='10%'>�Ӱ�ʱ��</td><td width='10%' >�������</td></tr>";
      for(var i=0;i<yan.length;i++){
        var y=yan[i];
        ta+="<tr><td colspan=6><hr size='1' noshade='noshade' color='#000210' style='border-bottom-style:dotted' width=650 ></td></tr>";
          ta+="<tr><td bgcolor='E4EAF4'><a href='xian.jsp?id="+y.childNodes[0].firstChild.data+"' style='color:04329C;font-size:12'>"+y.childNodes[1].firstChild.data+"</a></td>";
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
</head>

<BODY topmargin="0" onload="validate()">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td height="13" bgcolor="6C8ACC"> <img src="guide.gif"  align="absmiddle">
			�Ӱ����&gt;&gt;�Ӱ��¼</td>
    </tr>
</table><br>
&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:history.go(-1);" style="color:black;text-decoration:none">
<img src="func_return.gif" alt="����" width="16" height="16" border="0" align="absmiddle" >����
</a>
<br><br><br>
<div id="res"></div>
<center>
<a  onclick="gg()" style="cursor:hand"><font color=blue>��һҳ</font></a> 
<a  onclick="go()" style="cursor:hand"><font color=blue>��һҳ</font></a>
</center>
</body>
</html>
