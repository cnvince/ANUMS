<%@ page contentType="text/html; charset=GB2312" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<html>
<head>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate_form()
{
  if(document.form1.jians.value == "")
	{
		alert("进度简述不能为空!");
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

   var jd=document.getElementById("jindu");
   var jindu=jd.options[jd.selectedIndex].text;
   var jians=document.getElementById("jians").value;
   var fj=document.getElementById("fj").value;
   var rwid=document.getElementById("renwuid").value;
  var str="jindu="+jindu+"&jians="+jians+"&fj="+fj+"&rwid="+rwid;
   var url="../jindt";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(str);
}

function callback(){
   if(xmlHttp.readyState==4){
       var str=xmlHttp.responseText;
        if(trim(str)=="1")
            { alert("进度报告提交完毕");}
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
  <tr bgcolor="6C8ACC">
    <td height="13" > <img src="guide.gif"  align="absmiddle">任务管理&gt;&gt;我的任务&gt;&gt;当前任务&gt;&gt;添加进度报告</td>
    <td align="right" >&nbsp;</td>
  </tr>
</table>

<form name="form1" method="post" action="">
  <table width="100%" border="0" cellpadding="1" cellspacing="1" >
    <tr>
      <td height="12" colspan="4" >&nbsp; </td>
    </tr>

 
	<tr>
	   <td width="11%" bgcolor='BCCEED'>进度</td>
	   <td width="89%" colspan="3" bgcolor='BCCEED'><select name="rate" id="jindu">
                        <option value="10" selected>10</option>
                        <option value="20">20</option>
			<option value="30">30</option>
			<option value="40">40</option>
			<option value="50">50</option>
			<option value="60">60</option>
			<option value="70">70</option>
			<option value="80">80</option>
			<option value="90">90</option>
			<option value="100">100</option>
                       </select><span style="font-size:20;color:red">%</span>
      </td>
	</tr>
	
    <tr>
      <td width="11%" valign="middle" bgcolor='BCCEED'>进度简述</td>
      <td colspan="3" bgcolor='BCCEED'><textarea name="content" wrap="VIRTUAL"   style="width:100%;height:150" id="jians"> </textarea>
      </td>
    </tr>
	<tr>
      <td bgcolor='BCCEED'>附件</td>
      <td colspan="3" bgcolor='BCCEED'>
	  	<input name="attachment" type="file" id="fj" >&nbsp;
	   </td>
    </tr>
   <tr><td><input type=button value="添加" onclick="jian()"></td><td><input type=reset value=重置></td></tr>
  </table>


</form>


</body>
</html>
