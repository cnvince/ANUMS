<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
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
 

if(document.form1.ccr.value == "")
	{
		alert("������Ա����Ϊ��");
		return false;
	}
if(document.form1.md.value == "")
	{
		alert("����Ŀ�ĵز���Ϊ��");
		return false;
	}

if(document.form1.shi.value == "")
	{
		alert("������ɲ���Ϊ��!");
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
   var sr=document.getElementById("sercet");
   var secret=sr.options[sr.selectedIndex].text;
   var jj=document.getElementById("jinj");
   var jinj=jj.options[jj.selectedIndex].text;
   var ccr=document.getElementById("ccr").value;
   var md=document.getElementById("md").value;
   var starttime=document.getElementById("starttime").value;
   var endtime=document.getElementById("endtime").value;
   var reason=document.getElementById("shi").value;
   var str="title="+title+"&secret="+secret+"&jinj="+jinj+"&ccr="+ccr+"&md="+md+"&starttime="+starttime+"&endtime="+endtime+"&reason="+reason;
   var url="../tian";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(str);
}

function callback(){
   if(xmlHttp.readyState==4){
       var str=xmlHttp.responseText;
        if(trim(str)=="1")
            { alert("���������Ѿ�����");}
    }
}
</script>
</head>
<BODY topmargin="0"	>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
    <td height="13">
	<img src="guide.gif" align="absmiddle"> ���³���&gt;&gt;�������</td>
   <td align="right" >&nbsp;</td>
  </tr>
</table>
<table border="0" cellspacing="0" cellpadding="13">
  <tr> 
    <td> 
	<table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" >&nbsp;</td>
          <td height="23" align="center" valign="middle" > 
            <a href="javascript:history.go(-1);" style="color:black;text-decoration:none"> <img src="func_return.gif"  border="0" align="absmiddle">����</a> 
          </td>
          <td width="4" height="24" align="right">&nbsp;</td>
        </tr>
      </table>
	</td>
    
 
  </tr>
</table>

<table width="100%">
<form action="workcontroller.jsp" method="post" name="form1" target="_self" >
<tr><td >
 <table width="100%" border="0" cellpadding="1" cellspacing="1" class="maintable">
    <tr bgcolor="D0DCED">    	
    <td width="11%" valign="middle">����</td>
      <td valign="middle" colspan="3" > <input name="subject" type="text" style="width:78%" id="title"  maxlength="60">
      </td>
    </tr>
    <tr bgcolor="D0DCED">
      
		
    <td width="11%" valign="middle" >�ܼ�</td>
        <td width="39%" valign="middle"> 
			<select style="width: 50%" name="securityXid" id="sercet">
			<option value='1'>һ��</option>
                        <option value='2'>����</option>
                        <option value='3'>����</option>
			</select>
		</td>
      <td width="11%" valign="middle">�����̶�</td>
        <td width="39%" valign="middle">
			<select style="width: 50%;" name="instancyXid" id="jinj" >
			<option value='1'>һ��(180)</option>
                        <option value='2'>��(120)</option>
                        <option value='3'>����(60)</option>
			</select>
		</td>
    </tr>
	<tr bgcolor="D0DCED"> 
		<td valign="middle" width="11%"> <div align="justify">������Ա*</div></td>
		<td valign="middle" width="39%"> 
                 <input type="text" id="ccr">
	</td>
	
		<td align="right" valign="middle" width="11%"><div align="justify">Ŀ�ĵ�*</div></td>
		<td width="39%" valign="middle" >
		<input type="text" maxlength="120" style="width:90%" name="eDestination" id="md">
		</td>
	</tr>
	<tr bgcolor="D0DCED"> 
		<td width="11%" >����ʱ��</td>
		
		<%
   Calendar Now = Calendar.getInstance();
   Now.setTime(new java.util.Date());
   int y=Now.get(Calendar.YEAR);
   int m=Now.get(Calendar.MONTH)+1;
   int d=Now.get(Calendar.DAY_OF_MONTH);
   String str=y+"-"+m+"-"+d;
%>
		<td width="39%">  <input type="text" name="startDateTime" value=<%=str%> id="starttime">
</td>
		<td width="11%">Ԥ�Ʒ���ʱ��</td>
		<td width="39%">  <input type="text" name="endDateTime" value=<%=str%> id="endtime">
		</td>
	</tr>
	<tr bgcolor="D0DCED">
		<td valign="top">��������*</td>
		<td colspan="3"><textarea name="eDescription" style="width:80%" cols="60" rows="5" id="shi"></textarea></td>
	</tr>
	<tr ><td><input type=button value="�ύ" onclick="jia()"></td><td><input type=reset value="����"></td></tr>
  </table>
</td>
</tr>
</form>
</table>
</body>
</html>
