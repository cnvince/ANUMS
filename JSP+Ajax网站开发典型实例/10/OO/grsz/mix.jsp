<HTML>
<HEAD>
<TITLE>�û���������</TITLE>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate_form()
{
  if(document.form1.oldpassword.value == "")
	{
		alert("�����벻��Ϊ��!");
		return false;
	}
  if(bytelength(document.form1.oldpassword.value)<3||bytelength(document.form1.oldpassword.value)>20)
	{

		alert("�����볤�Ȳ��Ϸ�!");
		return false;
	}
  if(document.form1.newpassword.value == "")
	{
		alert("�����벻��Ϊ��!");
		return false;
	}
  if(bytelength(document.form1.newpassword.value)<3||bytelength(document.form1.newpassword.value)>20)
	{

		alert("�����볤�Ȳ��Ϸ�!");
		return false;
	}
  if(document.form1.newpassword.value!=document.form1.renpassword.value){
                alert("�������ȷ�����벻һ��");
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
            { alert("�����޸����");}
        else{
              alert("�������������");
            }
    }
}
</script>
</HEAD>
<body topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
    <td class="guide"><img src="guide.gif" align="absmiddle">
	�����趨&gt;&gt;�޸ĸ�������</td>
	<td align="right" class="guide" >&nbsp;</td>
  </tr>
</table>
<form name="form1" method="post" action="changePassword.jsp">
    
  <table width="100%" border="0"  cellpadding="1" cellspacing="1">
    <tr bgcolor="E4EAF4"> 
			<td colspan="2" >&nbsp;</td>
	</tr>
		<tr align="left" bgcolor="E4EAF4"> 
			
      <td width="11%" > ������ </td>
		  <td width="64%" > <input type="password" name="oldpassword" id="oldpassword"> </td>
		</tr>
		<tr align="left" bgcolor="E4EAF4"> 
			
      <td width="11%" > ������ </td>
			<td class="tint"> <input type="password" name="password"  id="newpassword"> </td>
		</tr>
		<tr bgcolor="E4EAF4"> 
			
      <td width="11%"> ȷ������ </td>
		  <td > 
			<input type="password" name="affirmPWD" id="renpassword"></td>
		</tr>
		<tr bgcolor="E4EAF4"> 
		
		<td width="25%" colspan="2" >��������3��20λ֮�䣻<br>
		  ������ֻ��Ϊ��ĸ��������ϣ�</td>
		
		</tr>
		<tr><td><input type=button value="�ύ" onclick="jian()"></td><td><input type=reset value="����"></td></tr>
  </table>
</form>

</BODY>
</HTML>