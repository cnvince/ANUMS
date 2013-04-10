<html>
<head>
<title>人事请假</title>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate_form()
{
  if(document.form1.title.value == "")
	{
		alert("主题不能为空!");
		return false;
	}
if(document.form1.starttime.value == "")
	{
		alert("请假开始时间不能为空");
		return false;
	}
  if(document.form1.endtime.value == "")
	{
		alert("请假结束时间不能为空!");
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

   var url="cha3.jsp";
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
   var ta="<table width='100%' border='0' cellpadding='0' cellspacing='1' ><tr bgcolor='D0DCED'> <td width='30%'>名称</td><td width='10%'>密级</td><td width='10%'>紧急程度</td><td width='10%' >请假时间</td></tr>";
      for(var i=0;i<yan.length;i++){
        var y=yan[i];
        ta+="<tr><td colspan=6></td></tr>";
          ta+="<tr><td bgcolor='E4EAF4'><a href='xian.jsp?id="+y.childNodes[0].firstChild.data+"' style='font-size:12;color:04329C'>"+y.childNodes[1].firstChild.data+"</a></td>";
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
<BODY topmargin="0">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr bgcolor='6C8ACC'>
		<td height="13" > <img src="guide.gif"  align="absmiddle">
			人事请假&gt;&gt;已创建文件&gt;&gt;文件查询
		</td>
    </tr>
</table>
<table width="100%" border="0" cellpadding="1" cellspacing="1" >
  <form name="form1"  method="post">
	<tr>
		<td  colspan="4">&nbsp;</td>
	</tr>
	<tr>
        <td width="16%" bgcolor="D0DCED">文件主题：</td>
		<td colspan="3" bgcolor="D0DCED">
			<input type="text" name="entitySubject" size="50" id="title">
		</td>
	</tr>
	<tr>
           <td width="16%" bgcolor="D0DCED">请假时间：从</td>
	   <td width="28%" bgcolor="D0DCED">
			<input name="startCreateDateTime" type="text" id="starttime" size="20" >
	   </td>
		
          <td width="6%" bgcolor="D0DCED">到</td>
	  <td width="45%" bgcolor="D0DCED">
			<input name="endCreateDateTime" type="text" id="endtime" size="20"  >
          </td>
	</tr>
       <tr><td><input type="button" value=查询 onclick="jia()"></td><td><input type=reset value=重置></td></tr>
  </form>
</table>
<div id="res"></div>
</body>