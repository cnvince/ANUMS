<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>

<html>
<head>
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
function jia()
{
	if(validate_form()==false)
		return;
	validate();
}
function validate(){
   createXMLHttpRequest();
   var tong=document.getElementById("tong").checked;
   var s;
   if(tong==true)
      s="1";
   var fou=document.getElementById("fou").checked;
   if(fou==true)  
      s="0";
   var yijian=document.getElementById("yijian").value; 
   var id=document.getElementById("id").value; 
  var str="s="+s+"&yijian="+yijian+"&id="+id;
   var url="shen1.jsp";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(str);
}

function callback(){
   if(xmlHttp.readyState==4){
       var str=xmlHttp.responseText;
        if(trim(str)=="1")
            { alert("�������");}
    }
}
</script>
</head>
<body>
<%
String id=request.getParameter("id");
%>
<input type="hidden" value=<%=id%> id=id>
<h3 style="background:6C8ACC;">��������</h3>
<div style="background:D4E2F4">
<form name="form1">
����������<input type=radio name=tong id=tong onclick="document.form1.tong.checked=true;document.form1.fou.checked=false;">ͨ��
<input type=radio name=fou id=fou onclick="document.form1.tong.checked=false;document.form1.fou.checked=true;">���<br>
���������<textarea id="yijian" rows=5 cols=18></textarea><br>
<input type=button value=�ύ onclick="jia()">
</form>
</div>
</body>
<html>
