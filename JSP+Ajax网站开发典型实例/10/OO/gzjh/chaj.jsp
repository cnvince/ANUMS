<html>
<head>
<title>menu</title>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type="text/javascript">
function validate_form()
{
  if(document.form1.name.value == "")
	{
		alert("�ƻ����Ʋ���Ϊ��!");
		return false;
	}
       return true;
}

function reg()
{
	if(validate_form()==false)
		return;
	getD();
}

function getD(){
  var name1=document.getElementById("name").value;
  createXMLHttpRequest();
  var url="chaj1.jsp?name="+name1;
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
   var ta="<table border=0 width=90%><th bgcolor='D0DCED'>����</th><th bgcolor='D0DCED'>����</th><th bgcolor='D0DCED'>״̬</th><th bgcolor='D0DCED'>ʱ��</th><th bgcolor='D0DCED'>����</th>";
   for(var i=0;i<content.length;i++){
      var y=content[i];
      ta+="<tr><td bgcolor='E4EAF4'>"+y.childNodes[0].firstChild.data+"</td>";
	  ta+="<td bgcolor='E4EAF4'>"+y.childNodes[1].firstChild.data+"</td>";
	  ta+="<td bgcolor='E4EAF4'>"+y.childNodes[2].firstChild.data+"</td>";
	  ta+="<td bgcolor='E4EAF4'>"+y.childNodes[3].firstChild.data+"</td>";
	  ta+="<td bgcolor='E4EAF4'>"+y.childNodes[4].firstChild.data+"</td>";
      ta+="</tr>";
      
   }
   ta+="</table>";
   document.getElementById("showdata").innerHTML=ta;
  }
}
</script>

</head>

<body  topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
    <td height="13" >
	<img src="guide.gif"  align="absmiddle">
    �����ƻ�&gt;&gt;��ѯ���˼ƻ�
	</td>
	<td align="right" >&nbsp;</td>
  </tr>
</table>
<h3>�����ѯ����</h3>
<form name="form1" method="post" action="chaj1.jsp">
  <table width="100%" border="0" cellpadding="1" cellspacing="1">
    <tr>
      <td colspan="2" >&nbsp;</td>
    </tr>
    <tr>
      <td width="11%" bgcolor="D0DCED">����:</td>
      <td width="89%" bgcolor="D0DCED"><input type="text" name="name" id="name"></td>
    </tr>
   </table>
  <table border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="50" align="center" valign="middle"><input type="button" onclick="reg();" value="��ѯ">
      </td>
	 <td><input type="reset" value="����"></td>
    </tr>
  </table>
</form>
<div id="showdata">
</DIV>
</center>
</body>
</html>
