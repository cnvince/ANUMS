<%@ page contentType="text/html; charset=GB2312" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>
��д���
</title>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate_form()
{
  if(document.form1.yijian.value == "")
	{
		alert("�����������Ϊ��!");
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
   var yijian=document.getElementById("yijian").value;
   var rwid=document.getElementById("renwuid").value;
  var str="yijian="+yijian+"&rwid="+rwid;
   var url="../yijian";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(str);
}

function callback(){
   if(xmlHttp.readyState==4){
       var str=xmlHttp.responseText;
        if(trim(str)=="1")
            { alert("��������ύ���");}
    }
}
</script>
</head>
<body topmargin="0">
<%
String id=request.getParameter("id");
int num=Integer.parseInt(id);
%>
<input type=hidden id="renwuid" value=<%=num%>>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="13" class="guide"> <img src=guide.gif  align="absmiddle">�������&gt;&gt;���·�������&gt;&gt;��ǰ����&gt;&gt;���</td>
  </tr>
</table> 	  
    <form name="form1" method="post" target="content">
  <table width="100%" border="0" cellpadding="1" cellspacing="1" >
    <tr>
      <td width="11%" valign="middle" >�������</td>
      <td width="89%" colspan="3" ><textarea name="content"  rows="5" style="width:90%" id="yijian"></textarea>
      </td>
    </tr>
    <tr>
      <td height="12" colspan="4" ><input type=button value=�ύ onclick="jian()"><input type=reset value=����></td>
    </tr>
  </table>
</form>	
</body>
</html>
