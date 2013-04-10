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
		alert("计划名称不能为空!");
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
        document.getElementById("showdata").innerHTML="<span style='font-size:20;color:red'>查询记录不存在</span>";
      }
   else{
   var ta="<table border=0 width=90%><th bgcolor='D0DCED'>名称</th><th bgcolor='D0DCED'>级别</th><th bgcolor='D0DCED'>状态</th><th bgcolor='D0DCED'>时间</th><th bgcolor='D0DCED'>操作</th>";
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
    工作计划&gt;&gt;查询本人计划
	</td>
	<td align="right" >&nbsp;</td>
  </tr>
</table>
<h3>输入查询名称</h3>
<form name="form1" method="post" action="chaj1.jsp">
  <table width="100%" border="0" cellpadding="1" cellspacing="1">
    <tr>
      <td colspan="2" >&nbsp;</td>
    </tr>
    <tr>
      <td width="11%" bgcolor="D0DCED">名称:</td>
      <td width="89%" bgcolor="D0DCED"><input type="text" name="name" id="name"></td>
    </tr>
   </table>
  <table border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="50" align="center" valign="middle"><input type="button" onclick="reg();" value="查询">
      </td>
	 <td><input type="reset" value="重置"></td>
    </tr>
  </table>
</form>
<div id="showdata">
</DIV>
</center>
</body>
</html>
