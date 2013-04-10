<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="java.util.*"%>
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
  if(bytelength(document.form1.title.value)<1||bytelength(document.form1.title.value)>20)
	{

		alert("主题长度不合法!");
		return false;
	}
if(document.form1.fzr.value == "")
	{
		alert("负责人不能为空");
		return false;
	}
if(document.form1.jias.value == "")
	{
		alert("加班事由不能为空");
		return false;
	}
if(document.form1.jiar.value == "")
	{
		alert("加班人姓名不能为空");
		return false;
	}
if(document.form1.jiad.value == "")
	{
		alert("加班地点不能为空");
		return false;
	}
if(document.form1.jiad.value == "")
	{
		alert("加班地点不能为空");
		return false;
	}
if(document.form1.starttime.value == "")
	{
		alert("加班开始时间不能为空");
		return false;
	}

if(document.form1.endtime.value == "")
	{
		alert("加班结束时间不能为空");
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
            { alert("加班申请已经发出");}
    }
}
</script>
</head>
<BODY topmargin="0"	>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="13" bgcolor="6C8ACC">
	<img src="guide.gif" align="absmiddle"> 加班管理&gt;&gt;创建文件</td>
   </tr>
</table>
<table border="0" cellspacing="0" cellpadding="13">
  <tr> 
    <td class="whitebg"> 
	<table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" class="buttonbg">&nbsp;</td>
          <td height="23" align="center" valign="middle" class="bbg"> 
            <a href="javascript:history.go(-1);" style="color:black;text-decoration:none"> <img src="func_return.gif"  border="0" align="absmiddle">返回</a> 
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
    <td width="11%" valign="middle">主题</td>
      <td valign="middle" colspan="3"> <input name="subject" type="text" style="width:78%" maxlength="60" id="title">      </td>
    </tr>
    <tr>
    <td width="11%" valign="middle" >密级</td>
        <td width="39%" valign="middle" > 
     <select style="width: 50%" name="securityXid" id="sercet">
	    <option value='1'>一般</option>
            <option value='2'>机密</option>
            <option value='3'>绝密</option>
      </select>		</td>
      <td width="11%" valign="middle" >紧急程度</td>
        <td width="39%" valign="middle">
	<select style="width: 50%;" name="instancyXid" id="jinj">
		<option value='1'>一般(180)</option>
               <option value='2'>急(120)</option>
               <option value='3'>紧急(60)</option>
	</select>		</td>
    </tr>
     <tr>
	    <td width="11%" > 加班处室</td>
		<td width="39%" >
                  <select name="bum" id="jiac">
                     <option>经理办</option>
                     <option>办公室</option>
                     <option>生产部</option>
                     <option>财务部</option>
                     <option>市场部</option>
                     <option>信息中心</option>
                  </select>
                  </td>
		<td width="11%" > 负责人</td>
		<td width="39%"><input name="principal" type="text" value="" id="fzr">
      </td>
</tr>
	  <tr>
	     <td class="deep">加班事由</td>
		 <td colspan="3" class="tint">
		 <textarea name="overtime_reason" style="width:78%" cols="60" rows="3" id="jias"></textarea>		 </td> 
	 </tr>
	 
	<tr> 
	  <td width="11%" > 加班人姓名</td>
	  <td width="39%" ><input name="applyname" type="text"   value="" id="jiar">
      <a href="#" ></a>	  </td>
		<td width="11%" >加班地点</td>
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
		<td width="11%" >加班起始时间</td>
		<td width="39%" >  <input type="text" name="startDateTime" value=<%=str%>  id="starttime">
			<a href="#"  border="0" align="absmiddle"></a>	  </td>
		<td width="11%" >加班结束时间</td>
		<td width="39%" >  <input type="text" name="endDateTime" value=<%=str%> id="endtime">
               </td>
	</tr>
	<tr>
	    <td width="11%" > 是否法定假日</td>
		<td width="39%"  >
		<select name="is_legalholiday" id="fad">
		<option value="1" selected >否</option>
		<option value="2" >是</option>
		</select>	  
              </td>
		</tr>
   <tr><td><input type=button value=提交 onclick="jian()"></td><td><input type=reset value="重置"></td></tr>
  </table>
</td>
</tr>
</form>
</table>
</body>
</html>
