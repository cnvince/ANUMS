<html>
<head>
<title>�Ӱ����</title>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate_form()
{
  if(document.form1.title.value == "")
	{
		alert("�Ӱ���ⲻ��Ϊ��!");
		return false;
	}
if(document.form1.starttime.value == "")
	{
		alert("�Ӱ࿪ʼʱ�䲻��Ϊ��");
		return false;
	}
  if(document.form1.endtime.value == "")
	{
		alert("�Ӱ����ʱ�䲻��Ϊ��!");
		return false;
	}
        return true;
}

function jia()
{
	if(validate_form()==false)
		return;
	validate();
}



function validate(){
   createXMLHttpRequest();

   var title=document.getElementById("title").value;
   var starttime=document.getElementById("starttime").value;
   var endtime=document.getElementById("endtime").value;
   var str="title="+title+"&starttime="+starttime+"&endtime="+endtime;
   var url="jiac1.jsp";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(str);
}

function callback(){
   if(xmlHttp.readyState==4){
       show();    }
}
function show(){
   var xmlDoc=xmlHttp.responseXML;
   var yan=xmlDoc.getElementsByTagName("content");
   var ta="<table width='100%' border='0' cellpadding='0' cellspacing='1' ><tr> <td width='30%'>�Ӱ�����</td><td width='10%'>�Ӱദ��</td><td width='10%'>�Ӱ࿪ʼʱ��</td><td width='10%' >�Ӱ����ʱ��</td></tr>";
      for(var i=0;i<yan.length;i++){
        var y=yan[i];
        ta+="<tr><td colspan=6><hr size='1' noshade='noshade' color='#000210' style='border-bottom-style:dotted' width=650 ></td></tr>";
          ta+="<tr><td><a href='xian.jsp?id="+y.childNodes[0].firstChild.data+"'>"+y.childNodes[1].firstChild.data+"</a></td>";
	  ta+="<td>"+y.childNodes[2].firstChild.data+"</td>";
          ta+="<td>"+y.childNodes[3].firstChild.data+"</td>";
	  ta+="<td>"+y.childNodes[4].firstChild.data+"</td>";
         ta+="</tr>";
	 }
   ta+="</table>";
   document.getElementById("res").innerHTML=ta;
   //alert(yan.length);
}
</script>
</head>

<BODY topmargin="0">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td height="13" bgcolor="6C8ACC"> <img src="guide.gif"  align="absmiddle">
			�Ӱ����&gt;&gt;�Ѵ����ļ�&gt;&gt;�ļ���ѯ
		</td>
    </tr>
</table>
	<table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" class="buttonbg">&nbsp;</td>
          <td height="23" align="center" valign="middle" class="bbg"> 
            <a href="javascript:history.go(-1);" style="color:black;text-decoration:none"> <img src="func_return.gif"  border="0" align="absmiddle">����</a> 
          </td>
        </tr>
      </table>
<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="D0DCED">
  <form name="form1"  method="post">
	<tr>
		<td colspan="4">&nbsp;</td>
	</tr>
	<tr>
      <td width="16%" >�Ӱ���⣺</td>
		<td colspan="3">
			<input type="text" name="entitySubject" size="50" id="title" >
		</td>
	</tr>
	<tr>
      <td width="16%">�Ӱ�ʱ�䣺��</td>
	  <td width="33%">
			<input name="" type="text" id="starttime" size="20" ></td>
		
      <td width="6%">��</td>
	  <td width="45%">
			<input name="" type="text" id="endtime" size="20" >
        </td>
	</tr><br><br>
	<tr><td><input type=button value="��ѯ" onClick="jia()"></td><td><input type=reset value="����"></td></tr>
	</form>
</table>
<div id="res"></div>
</body>