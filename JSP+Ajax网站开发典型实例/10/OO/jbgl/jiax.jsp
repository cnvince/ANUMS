<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="java.util.*"%>
<html>
<head>
<title>������</title>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate_form()
{
  if(document.form1.title.value == "")
	{
		alert("���ⲻ��Ϊ��!");
		return false;
	}
  if(bytelength(document.form1.title.value)<1||bytelength(document.form1.title.value)>20)
	{

		alert("���ⳤ�Ȳ��Ϸ�!");
		return false;
	}
if(document.form1.fzr.value == "")
	{
		alert("�����˲���Ϊ��");
		return false;
	}
if(document.form1.jias.value == "")
	{
		alert("�Ӱ����ɲ���Ϊ��");
		return false;
	}
if(document.form1.jiar.value == "")
	{
		alert("�Ӱ�����������Ϊ��");
		return false;
	}
if(document.form1.jiad.value == "")
	{
		alert("�Ӱ�ص㲻��Ϊ��");
		return false;
	}
if(document.form1.jiad.value == "")
	{
		alert("�Ӱ�ص㲻��Ϊ��");
		return false;
	}
if(document.form1.starttime.value == "")
	{
		alert("�Ӱ࿪ʼʱ�䲻��Ϊ��");
		return false;
	}

if(document.form1.endtime.value == "")
	{
		alert("�Ӱ����ʱ�䲻��Ϊ��");
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
   var sr=document.getElementById("sercet");
   var secret=sr.options[sr.selectedIndex].text;
   var jj=document.getElementById("jinj");
   var jinj=jj.options[jj.selectedIndex].text; 
   var jc=document.getElementById("jiac");
   var jiac=jc.options[jc.selectedIndex].text; 
   var fzr=document.getElementById("fzr").value;
   var jias=document.getElementById("jias").value;
   var jiar=document.getElementById("jiar").value;
   var jiad=document.getElementById("jiad").value;
   var starttime=document.getElementById("starttime").value;
   var endtime=document.getElementById("endtime").value;
   var fd=document.getElementById("fad");
   var fad=fd.options[fd.selectedIndex].text; 
   
  var str="title="+title+"&secret="+secret+"&jinj="+jinj+"&jiac="+jiac+"&fzr="+fzr+"&jias="+jias+"&jiar="+jiar+"&jiad="+jiad+"&starttime="+starttime+"&endtime="+endtime+"&fad="+fad;
   var url="../jiax";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(str);
}

function callback(){
   if(xmlHttp.readyState==4){
       var str=xmlHttp.responseText;
         
        if(trim(str)=="1")
            { alert("�Ӱ������Ѿ�����");}
    }
}
</script>
</head>
<BODY topmargin="0"	>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="13" bgcolor="6C8ACC">
	<img src="guide.gif" align="absmiddle"> �Ӱ����&gt;&gt;�����ļ�</td>
   </tr>
</table>
<table border="0" cellspacing="0" cellpadding="13">
  <tr> 
    <td class="whitebg"> 
	<table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" class="buttonbg">&nbsp;</td>
          <td height="23" align="center" valign="middle" class="bbg"> 
            <a href="javascript:history.go(-1);" style="color:black;text-decoration:none"> <img src="func_return.gif"  border="0" align="absmiddle">����</a> 
          </td>
          <td width="4" height="24" align="right" class="buttonbg">&nbsp;</td>
        </tr>
      </table>
	</td>
  </tr>
</table>
<table width="100%">
<form action="" method="post" name="form1"  id="form1">
<tr><td ><table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="D4E2F4">
    <tr>    	
    <td width="11%" valign="middle">����</td>
      <td valign="middle" colspan="3"> <input name="subject" type="text" style="width:78%" maxlength="60" id="title">      </td>
    </tr>
    <tr>
    <td width="11%" valign="middle" >�ܼ�</td>
        <td width="39%" valign="middle" > 
     <select style="width: 50%" name="securityXid" id="sercet">
	    <option value='1'>һ��</option>
            <option value='2'>����</option>
            <option value='3'>����</option>
      </select>		</td>
      <td width="11%" valign="middle" >�����̶�</td>
        <td width="39%" valign="middle">
	<select style="width: 50%;" name="instancyXid" id="jinj">
		<option value='1'>һ��(180)</option>
               <option value='2'>��(120)</option>
               <option value='3'>����(60)</option>
	</select>		</td>
    </tr>
     <tr>
	    <td width="11%" > �Ӱദ��</td>
		<td width="39%" >
                  <select name="bum" id="jiac">
                     <option>�����</option>
                     <option>�칫��</option>
                     <option>������</option>
                     <option>����</option>
                     <option>�г���</option>
                     <option>��Ϣ����</option>
                  </select>
                  </td>
		<td width="11%" > ������</td>
		<td width="39%"><input name="principal" type="text" value="" id="fzr">
      </td>
</tr>
	  <tr>
	     <td class="deep">�Ӱ�����</td>
		 <td colspan="3" class="tint">
		 <textarea name="overtime_reason" style="width:78%" cols="60" rows="3" id="jias"></textarea>		 </td> 
	 </tr>
	 
	<tr> 
	  <td width="11%" > �Ӱ�������</td>
	  <td width="39%" ><input name="applyname" type="text"   value="" id="jiar">
      <a href="#" ></a>	  </td>
		<td width="11%" >�Ӱ�ص�</td>
		<td width="39%" valign="middle" >
			<input type="text" maxlength="90"  name="overtime_place" value="" id="jiad">		</td>
	</tr>
	<tr> 
<%
   Calendar Now = Calendar.getInstance();
   Now.setTime(new java.util.Date());
   int y=Now.get(Calendar.YEAR);
   int m=Now.get(Calendar.MONTH)+1;
   int d=Now.get(Calendar.DAY_OF_MONTH);
   String str=y+"-"+m+"-"+d;
%>
		<td width="11%" >�Ӱ���ʼʱ��</td>
		<td width="39%" >  <input type="text" name="startDateTime" value=<%=str%>  id="starttime">
			<a href="#"  border="0" align="absmiddle"></a>	  </td>
		<td width="11%" >�Ӱ����ʱ��</td>
		<td width="39%" >  <input type="text" name="endDateTime" value=<%=str%> id="endtime">
               </td>
	</tr>
	<tr>
	    <td width="11%" > �Ƿ񷨶�����</td>
		<td width="39%"  >
		<select name="is_legalholiday" id="fad">
		<option value="1" selected >��</option>
		<option value="2" >��</option>
		</select>	  
              </td>
		</tr>
   <tr><td><input type=button value=�ύ onclick="jian()"></td><td><input type=reset value="����"></td></tr>
  </table>
</td>
</tr>
</form>
</table>
</body>
</html>
