<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<html>
<head>
<title>�����־</title>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate_form()
{
  if(document.form1.title.value == "")
	{
		alert("��־���ⲻ��Ϊ��!");
		return false;
	}
  if(bytelength(document.form1.title.value)<1||bytelength(document.form1.title.value)>25)
	{

		alert("��־���ⳤ�Ȳ��Ϸ�!");
		return false;
	}

if(document.form1.content.value == "")
	{
		alert("��־���ݲ���Ϊ��");
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
   var title=document.getElementById("title").value;
   var tp=document.getElementById("type");
   var type=tp.options[tp.selectedIndex].text;
   var sr=document.getElementById("secret");
   var secret=sr.options[sr.selectedIndex].text;
   var startdate=document.getElementById("startdate").value;
  var content=document.getElementById("content").value;
    
  var str="title="+title+"&type="+type+"&secret="+secret+"&startdate="+startdate+"&content="+content;
   var url="../rizhi";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(str);
}

function callback(){
   if(xmlHttp.readyState==4){
       var str=xmlHttp.responseText;
        if(trim(str)=="1")
            { alert("������־�������");}
    }
}
</script>
</head>
<body topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr bgcolor="6C8ACC">
		<td ><img src="guide.gif" align="absmiddle">
		��־&gt;&gt;�����־</td>
		<td align="right" >&nbsp;</td>
	</tr>
</table>
<form action="" method="post" name="form1">
<table width="100%" border="0" cellpadding="1" cellspacing="1">
	<tr>
		<td colspan="4"  height="12">&nbsp;</td>
	</tr>
	<tr>
		<td width="11%" bgcolor="BCCEED">����*</td>
		<td colspan="3" bgcolor="BCCEED">
               <input name="title" type="text"id="title" value="" size="50"></td>
	</tr>
	<tr>
		<td width="11%" bgcolor="BCCEED">��־����</td>
		<td width="39%" bgcolor="BCCEED">
                <select name="typeXID" id="type">
		<option value=0>�����ܽ�</option>
                <option value=1 selected>�����ƻ�</option>
                <option value=2>�����ĵ�</option>
		</select>
                </td>
		<td width="11%" bgcolor="BCCEED">���ܼ���</td>
		<td width="39%" bgcolor="BCCEED"><select name="isprivate" id="secret">
			<option value="0" >����</option>
			<option value="1" selected>����</option>
	</select>	</tr>
	<tr>
		<td width="11%" bgcolor="BCCEED">ʱ��</td>
		<td colspan="3" bgcolor="BCCEED">
 <%

   Calendar Now = Calendar.getInstance();
   Now.setTime(new java.util.Date());
   int y=Now.get(Calendar.YEAR);
   int m=Now.get(Calendar.MONTH)+1;
   int d=Now.get(Calendar.DAY_OF_MONTH);
   String str=y+"-"+m+"-"+d;
%>
 <input name="startDate" type="text"  value=<%=str%> maxlength="10"  size="10" id="startdate"> 
</td>
	</tr>
	<tr>
		<td width="11%" height="148" valign="middle" bgcolor="BCCEED">����</td>
		<td colspan="3" class="tint" bgcolor="BCCEED"><textarea name="content"
			style="width:100%;height:150"  id="content"></textarea></td>
	</tr>
        <tr><td><input type=button value=������־ onclick="jian()"></td><td><input type=reset value=����></td></tr>
</table>
</form>
</body>
</html>
