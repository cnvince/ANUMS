<HTML>
<HEAD>
<TITLE>用户密码设置</TITLE>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate_form()
{
  if(document.form1.oldpassword.value == "")
	{
		alert("旧密码不能为空!");
		return false;
	}
  if(bytelength(document.form1.oldpassword.value)<3||bytelength(document.form1.oldpassword.value)>20)
	{

		alert("旧密码长度不合法!");
		return false;
	}
  if(document.form1.newpassword.value == "")
	{
		alert("新密码不能为空!");
		return false;
	}
  if(bytelength(document.form1.newpassword.value)<3||bytelength(document.form1.newpassword.value)>20)
	{

		alert("新密码长度不合法!");
		return false;
	}
  if(document.form1.newpassword.value!=document.form1.renpassword.value){
                alert("新密码和确认密码不一致");
                return false;
         }
       return true;
}

function jian()
{
	if(validate_form()==false)
		return;
	validate();
}


function validate(){
   createXMLHttpRequest();
   var oldpassword=document.getElementById("oldpassword").value;
   var newpassword=document.getElementById("newpassword").value;
   var str="oldpassword="+oldpassword+"&newpassword="+newpassword;
   var url="mixiu.jsp";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(str);
}

function callback(){
   if(xmlHttp.readyState==4){
       var str=xmlHttp.responseText;
        if(trim(str)=="1")
            { alert("密码修改完成");}
        else{
              alert("旧密码输入错误");
            }
    }
}
</script>
</HEAD>
<body topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
    <td class="guide"><img src="guide.gif" align="absmiddle">
	个人设定&gt;&gt;修改个人密码</td>
	<td align="right" class="guide" >&nbsp;</td>
  </tr>
</table>
<form name="form1" method="post" action="changePassword.jsp">
    
  <table width="100%" border="0"  cellpadding="1" cellspacing="1">
    <tr bgcolor="E4EAF4"> 
			<td colspan="2" >&nbsp;</td>
	</tr>
		<tr align="left" bgcolor="E4EAF4"> 
			
      <td width="11%" > 旧密码 </td>
		  <td width="64%" > <input type="password" name="oldpassword" id="oldpassword"> </td>
		</tr>
		<tr align="left" bgcolor="E4EAF4"> 
			
      <td width="11%" > 新密码 </td>
			<td class="tint"> <input type="password" name="password"  id="newpassword"> </td>
		</tr>
		<tr bgcolor="E4EAF4"> 
			
      <td width="11%"> 确认密码 </td>
		  <td > 
			<input type="password" name="affirmPWD" id="renpassword"></td>
		</tr>
		<tr bgcolor="E4EAF4"> 
		
		<td width="25%" colspan="2" >·密码在3到20位之间；<br>
		  ·密码只能为字母和数字组合；</td>
		
		</tr>
		<tr><td><input type=button value="提交" onclick="jian()"></td><td><input type=reset value="重置"></td></tr>
  </table>
</form>

</BODY>
</HTML>