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
 

if(document.form1.qjr.value == "")
	{
		alert("����˲���Ϊ��");
		return false;
	}

  if(document.form1.reason.value == "")
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
   var sr=document.getElementById("secret");
   var secret=sr.options[sr.selectedIndex].text;
   var jj=document.getElementById("jinj");
   var jinj=jj.options[jj.selectedIndex].text;
   var tp=document.getElementById("type");
   var type=tp.options[tp.selectedIndex].text;
   var qjr=document.getElementById("qjr").value;
   var bm=document.getElementById("bum");
   var bum=bm.options[bm.selectedIndex].text;
   var starttime=document.getElementById("starttime").value;
   var endtime=document.getElementById("endtime").value;
   var reason=document.getElementById("reason").value;
    
  var str="title="+title+"&secret="+secret+"&jinj="+jinj+"&type="+type+"&qjr="+qjr+"&bum="+bum+"&starttime="+starttime+"&endtime="+endtime+"&reason="+reason;
   var url="../tx";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(str);
}

function callback(){
   if(xmlHttp.readyState==4){
       var str=xmlHttp.responseText;
        if(trim(str)=="1")
            { alert("��������Ѿ�����");}
    }
}
</script>
</head>
<BODY topmargin="0"	>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
    <td height="13" >
	<img src="guide.gif" align="absmiddle"> �������&gt;&gt;�����ļ�</td>
   </tr>
</table>
<table border="0" cellspacing="0" cellpadding="13">
  <tr> 
    <td class="whitebg"> 
	<table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" >&nbsp;</td>
          <td height="23" align="center" valign="middle"> 
            <a href="javascript:history.go(-1);" style="color:black;text-decoration:none"> <img src="func_return.gif"  border="0" align="absmiddle">����</a> 
          </td>
          <td width="4" height="24" align="right" >&nbsp;</td>
        </tr>
      </table>
	</td>
  </tr>
</table>

<table width="100%">
<form action="" method="post" name="form1" target="_self" id="form1">
<tr><td>
 <table width="100%" border="0" cellpadding="1" cellspacing="1" >
    <tr>    	
    <td width="11%" valign="middle" bgcolor="D0DCED">����</td>
      <td valign="middle" colspan="3" bgcolor="D0DCED"> <input name="subject" type="text" style="width:78%" value="" maxlength="60" id="title">      </td>
    </tr>
    <tr>

    <td width="11%" valign="middle" bgcolor="D0DCED">�ܼ�</td>
        <td width="39%" valign="middle" bgcolor="D0DCED"> 
			<select style="width: 50%" name="securityXid" id="secret">
			<option value='1'>һ��</option>
                        <option value='2'>����</option>
                        <option value='3'>����</option>
			</select>		</td>
      <td width="11%" valign="middle" bgcolor="D0DCED">�����̶�</td>
        <td width="39%" valign="middle" bgcolor="D0DCED">
			<select style="width: 50%;" name="instancyXid" id="jinj">
			<option value='1'>һ��(180)</option>
                        <option value='2'>��(120)</option>
                        <option value='3'>����(60)</option>
			</select>		</td>
    </tr>
	<tr>
		<td width="11%" bgcolor="D0DCED">������</td>
		<td colspan="3" bgcolor="D0DCED">
			<select name="typeXid" id="type">
			<option value='1'>����</option>
                        <option value='2'>�¼�</option>
                        <option value='3'>���</option>
			</select></td>
	</tr>
	<tr>
		<td valign="middle" width="11%" bgcolor="D0DCED">
<div align="justify">����ˣ�</div></td>
		<td valign="middle" width="39%"bgcolor="D0DCED" >
			
			<input type="text" name="applyerId" value=<%=(String)session.getAttribute("name")%> id="qjr">
				<a href="#"></a>		</td>

		<td align="right" valign="middle" width="11%" bgcolor="D0DCED">
                <div align="justify">���ڲ��ţ�</div></td>
		       <td width="39%" valign="middle" bgcolor="D0DCED">
			   <select name="bum" id="bum">
                     <option>�����</option>
                     <option>�칫��</option>
                     <option>������</option>
                     <option>����</option>
                     <option>�г���</option>
                     <option>��Ϣ����</option>
                  </select>
				</td>
	</tr>
	<tr>
		<td width="11%" bgcolor="D0DCED" >��ʼʱ�䣺</td>
		<td width="39%" bgcolor="D0DCED">
<%
   Calendar Now = Calendar.getInstance();
   Now.setTime(new java.util.Date());
   int y=Now.get(Calendar.YEAR);
   int m=Now.get(Calendar.MONTH)+1;
   int d=Now.get(Calendar.DAY_OF_MONTH);
   String str=y+"-"+m+"-"+d;
%>
			<input type="text" name="startDateTime" value=<%=str%> id="starttime">
		<td width="11%" bgcolor="D0DCED">����ʱ�䣺</td>
		<td width="39%" bgcolor="D0DCED">
		<%
                d=d+1;
                str=y+"-"+m+"-"+d;
              %>	
			<input type="text" name="endDateTime" value=<%=str%> id="endtime">
	</tr>
<tr><td bgcolor="D0DCED">���ԭ��</td><td bgcolor="D0DCED"><textarea cols=32 rows=5 id="reason"></textarea></td></tr>
<tr><td><input type=button value=��� onclick="jia()"></td><td><input type=reset value=����></td></tr>
  </table>
</td>
</tr>
</form>
</table>
</body>
</html>
