<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>

<html>
<head>
<title>工作表单</title>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate_form()
{
  if(document.form1.title.value == "")
	{
		alert("主题不能为空!");
		return false;
	}
 

if(document.form1.qjr.value == "")
	{
		alert("请假人不能为空");
		return false;
	}

  if(document.form1.reason.value == "")
	{
		alert("请假事由不能为空!");
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
            { alert("请假申请已经发出");}
    }
}
</script>
</head>
<BODY topmargin="0"	>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
    <td height="13" >
	<img src="guide.gif" align="absmiddle"> 人事请假&gt;&gt;创建文件</td>
   </tr>
</table>
<table border="0" cellspacing="0" cellpadding="13">
  <tr> 
    <td class="whitebg"> 
	<table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" >&nbsp;</td>
          <td height="23" align="center" valign="middle"> 
            <a href="javascript:history.go(-1);" style="color:black;text-decoration:none"> <img src="func_return.gif"  border="0" align="absmiddle">返回</a> 
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
    <td width="11%" valign="middle" bgcolor="D0DCED">主题</td>
      <td valign="middle" colspan="3" bgcolor="D0DCED"> <input name="subject" type="text" style="width:78%" value="" maxlength="60" id="title">      </td>
    </tr>
    <tr>

    <td width="11%" valign="middle" bgcolor="D0DCED">密级</td>
        <td width="39%" valign="middle" bgcolor="D0DCED"> 
			<select style="width: 50%" name="securityXid" id="secret">
			<option value='1'>一般</option>
                        <option value='2'>机密</option>
                        <option value='3'>绝密</option>
			</select>		</td>
      <td width="11%" valign="middle" bgcolor="D0DCED">紧急程度</td>
        <td width="39%" valign="middle" bgcolor="D0DCED">
			<select style="width: 50%;" name="instancyXid" id="jinj">
			<option value='1'>一般(180)</option>
                        <option value='2'>急(120)</option>
                        <option value='3'>紧急(60)</option>
			</select>		</td>
    </tr>
	<tr>
		<td width="11%" bgcolor="D0DCED">请假类别：</td>
		<td colspan="3" bgcolor="D0DCED">
			<select name="typeXid" id="type">
			<option value='1'>病假</option>
                        <option value='2'>事假</option>
                        <option value='3'>年假</option>
			</select></td>
	</tr>
	<tr>
		<td valign="middle" width="11%" bgcolor="D0DCED">
<div align="justify">请假人：</div></td>
		<td valign="middle" width="39%"bgcolor="D0DCED" >
			
			<input type="text" name="applyerId" value=<%=(String)session.getAttribute("name")%> id="qjr">
				<a href="#"></a>		</td>

		<td align="right" valign="middle" width="11%" bgcolor="D0DCED">
                <div align="justify">所在部门：</div></td>
		       <td width="39%" valign="middle" bgcolor="D0DCED">
			   <select name="bum" id="bum">
                     <option>经理办</option>
                     <option>办公室</option>
                     <option>生产部</option>
                     <option>财务部</option>
                     <option>市场部</option>
                     <option>信息中心</option>
                  </select>
				</td>
	</tr>
	<tr>
		<td width="11%" bgcolor="D0DCED" >开始时间：</td>
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
		<td width="11%" bgcolor="D0DCED">结束时间：</td>
		<td width="39%" bgcolor="D0DCED">
		<%
                d=d+1;
                str=y+"-"+m+"-"+d;
              %>	
			<input type="text" name="endDateTime" value=<%=str%> id="endtime">
	</tr>
<tr><td bgcolor="D0DCED">请假原因：</td><td bgcolor="D0DCED"><textarea cols=32 rows=5 id="reason"></textarea></td></tr>
<tr><td><input type=button value=请假 onclick="jia()"></td><td><input type=reset value=重置></td></tr>
  </table>
</td>
</tr>
</form>
</table>
</body>
</html>
