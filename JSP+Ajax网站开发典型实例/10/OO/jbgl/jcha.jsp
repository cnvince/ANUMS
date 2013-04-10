<html>
<head>
<title>加班管理</title>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate_form()
{
  if(document.form1.title.value == "")
	{
		alert("加班标题不能为空!");
		return false;
	}
if(document.form1.starttime.value == "")
	{
		alert("加班开始时间不能为空");
		return false;
	}
  if(document.form1.endtime.value == "")
	{
		alert("加班结束时间不能为空!");
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
   var url="jcha1.jsp";
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
   var ta="<table width='100%' border='0' cellpadding='0' cellspacing='1' ><tr bgcolor='D4E2F4'> <td width='30%'>名称</td><td width='10%'>密级</td><td width='10%'>紧急程度</td><td width='10%' >加班时间</td></tr>";
      for(var i=0;i<yan.length;i++){
        var y=yan[i];
        ta+="<tr bgcolor='E4EAF4'><td colspan=6><hr size='1' noshade='noshade' color='#000210' style='border-bottom-style:dotted' width=650 ></td></tr>";
          ta+="<tr><td><a href='xian.jsp?id="+y.childNodes[0].firstChild.data+"' style='color:04329C'>"+y.childNodes[1].firstChild.data+"</a></td>";
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
			加班管理&gt;&gt;已处理文件查询
		</td>
    </tr>
</table>
<table border="0" cellspacing="8" cellpadding="0">
  <tr>
    <td class="whitebg">

      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" class="buttonbg">&nbsp;</td>
          <td height="23" align="center" valign="middle" class="bbg"> 

			<a href="jiad.jsp" style="color:black;text-decoration:none"> <img src="func_list.gif" border="0" align="absmiddle" alt="">待处理文件</a>

		  </td>
          <td width="4" height="24" align="right" class="buttonbg">&nbsp;</td>
        </tr>
      </table>

    </td>
    <td class="whitebg">

      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" class="buttonbg">&nbsp;</td>
          <td height="23" align="center" valign="middle" class="bbg"> 
			<a href="jiay.jsp" style="color:black;text-decoration:none"> <img src="func_list.gif" border="0" align="absmiddle" alt="">已处理文件</a>
		  </td>
          <td width="4" height="24" align="right" class="buttonbg">&nbsp;</td>
        </tr>
      </table>

    </td>

    <td class="whitebg">

      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" class="buttonbg">&nbsp;</td>
          <td height="23" align="center" valign="middle" class="bbg"> 

			<a href="jcha.jsp" style="color:black;text-decoration:none"> <img src="func_search.gif" border="0" align="absmiddle" alt="">已处理文件查询</a>

		  </td>
          <td width="4" height="24" align="right" class="buttonbg">&nbsp;</td>
        </tr>
      </table>
    </td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="1" cellspacing="1" >
  <form name="form1" action="" method="post">
	<tr>
		<td colspan="4">&nbsp;</td>
	</tr>
	<tr>
		
      <td width="11%" bgcolor="E4EAF4"> 文件主题：</td>
		<td colspan="3" >
			<input type="text" name="title" size="60" id="title">
		</td>
	</tr>
	<tr>
		
      <td width="11%" bgcolor="E4EAF4">完成时间：从</td>
		<td width="25%" >
			<input name="starttime" type="text" id="starttime" size="20" >
		</td>
      <td width="11%" bgcolor="E4EAF4">到</td>
		<td width="53%" >
			<input name="endtime" type="text" id="endtime" size="20" >
			
		</td>
	</tr>
      <tr><td><input type=button value="查询" onclick="jia()"></td><td><input type=reset value="重置"></td></tr>
	</form>
</table>
<div id="res"></div>
</body>