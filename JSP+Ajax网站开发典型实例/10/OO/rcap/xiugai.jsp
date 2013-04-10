<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%@ page import="java.util.*"%>
<html>
<head>
<title>
新建日程安排
</title> 
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate_form()
{
  if(document.form1.zhuti.value == "")
	{
		alert("主题不能为空!");
		return false;
	}
  if(bytelength(document.form1.zhuti.value)<1||bytelength(document.form1.zhuti.value)>25)
	{

		alert("主题长度不合法!");
		return false;
	}

if(document.form1.content.value == "")
	{
		alert("日程安排不能为空");
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
   var id=document.getElementById("id").value;
   var zhuti=document.getElementById("zhuti").value;
   var starttime=document.getElementById("starttime").value;
   var sh=document.getElementById("starthour");
   var starthour=sh.options[sh.selectedIndex].text;
    var sm=document.getElementById("startminute");
   var startminute=sm.options[sm.selectedIndex].text;
   var endtime=document.getElementById("endtime").value;
   var eh=document.getElementById("endhour");
   var endhour=eh.options[eh.selectedIndex].text;
    var em=document.getElementById("endminute");
   var endminute=em.options[em.selectedIndex].text;
    var tp=document.getElementById("type");
   var type=tp.options[tp.selectedIndex].text;
    var sr=document.getElementById("secret");
   var secret=sr.options[sr.selectedIndex].text;
    var pi=document.getElementById("priority");
   var priority=pi.options[pi.selectedIndex].text;
    var fi=document.getElementById("finish");
   var finish=fi.options[fi.selectedIndex].text;
    var ak=document.getElementById("awake");
   var awake=ak.options[ak.selectedIndex].text;
  var content=document.getElementById("content").value;
    
  var str="id="+id+"&zhuti="+zhuti+"&starttime="+starttime+"&starthour="+starthour+"&startminute="+startminute+"&endtime="+endtime+"&endhour="+endhour+"&endminute="+endminute+"&type="+type+"&secret="+secret+"&priority="+priority+"&finish="+finish+"&awake="+awake+"&content="+content;
   var url="../xiug";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(str);
}

function callback(){
   if(xmlHttp.readyState==4){
       var str=xmlHttp.responseText;
        if(trim(str)=="1")
            { alert("日程事件修改完毕");}
    }
}
</script>
</head>

<body topmargin="0" >
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
    <td height="13"  class="guide"> <img src="guide.gif"  align="absmiddle">
	日程安排&gt;&gt;编辑日程</td>
	<td align="right"   >&nbsp;</td>
  </tr>
</table>
<%
String id=request.getParameter("id");
int num=Integer.parseInt(id);
String sql="select * from oa_richeng where id="+num;
ResultSet rs=con.getRs(sql);
rs.next();
%>
<form name="form1" method="post" action="">

<input type=hidden name="id" id="id" value=<%=id%>>
  <table width="100%" border="0" cellpadding="1" cellspacing="1" >
  
	<tr> 
      <td width="14%" bgcolor="D0DCED">主题*</td>
      <td colspan="3" bgcolor="D0DCED"> <input name="subject" type="text"  style="width:80%" size="65" maxlength="50" id="zhuti" value=<%=rs.getString("zhuti")%>>      </td>
    </tr>
    <tr> 
     <%
        String starttime=rs.getString("starttime");
	String[] s1= starttime.split(" ");
	String[] s11=s1[1].split(":"); 
     %>
      <td width="14%" bgcolor="D0DCED">开始时间</td>
      <td width="36%" bgcolor="D0DCED"> 
	  <input name="startDate" type="text"     maxlength="10" readonly size="10" id="starttime" value=<%=s1[0]%>> 
	  	    <select name="startHour" id="starthour">
                    <option><%=s11[0]%></option>
		    <option value="0">00</option>
                    <option value="1">01</option>
                    <option value="2">02</option>
                    <option value="3">03</option>
                    <option value="4">04</option>
                    <option value="5">05</option>
                    <option value="6">06</option>
                    <option value="7">07</option>
                    <option value="8">08</option>
                    <option value="9">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18</option>
                    <option value="19">19</option>
                    <option value="20">20</option>
                    <option value="21">21</option>
                    <option value="22">22</option>
                    <option value="23">23</option>
				</select>：  
				<select name="startMinute"  id="startminute">
                   <option value="0"><%=s11[1]%></option>
                  <option value="0">00</option>
                  <option value="5">05</option>
                  <option value="10">10</option>
                  <option value="15">15</option>
                  <option value="20">20</option>
                  <option value="25">25</option>
                  <option value="30">30</option>
                  <option value="35">35</option>
                  <option value="40">40</option>
                  <option value="45">45</option>
                  <option value="50">50</option>
                  <option value="55">55</option>
                </select></td>
      <td width="11%" bgcolor="D0DCED">结束时间</td>
      <td width="39%" bgcolor="D0DCED"> 
<%
	String endtime=rs.getString("endtime");
	String[] s2= endtime.split(" ");
        String[] s21=s2[1].split(":"); 
	%>
	  <input name="endDate" type="text" class="field"   maxlength="10" readonly size="10" id="endtime" value=<%=s2[0]%>>
	   				<select name="endHour" id="endhour">
                    <option value="0"><%=s21[0]%></option>
		    <option value="0">00</option>
                    <option value="1">01</option>
                    <option value="2">02</option>
                    <option value="3">03</option>
                    <option value="4">04</option>
                    <option value="5">05</option>
                    <option value="6">06</option>
                    <option value="7">07</option>
                    <option value="8">08</option>
                    <option value="9" selected>09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18</option>
                    <option value="19">19</option>
                    <option value="20">20</option>
                    <option value="21">21</option>
                    <option value="22">22</option>
                    <option value="23">23</option>
				</select>：
				<select name="endMinute"  id="endminute">
                    <option><%=s21[1]%></option>
                    <option value="0">00</option>
                    <option value="5">05</option>
                    <option value="10">10</option>
                    <option value="15">15</option>
                    <option value="20">20</option>
                    <option value="25">25</option>
                    <option value="30">30</option>
                    <option value="35">35</option>
                    <option value="40">40</option>
                    <option value="45">45</option>
                    <option value="50">50</option>
                    <option value="55">55</option>
		</select>      </td>
    </tr>
   
    <tr> 
      <td width="14%" bgcolor="D0DCED">类型</td>
      <td width="36%" bgcolor="D0DCED"> <select name="arrTypeID" id="type">
          <opiton><%=rs.getString("arrtype")%></option>
          <option value="0">开会</option>
          <option value="1">宴会</option>
          <option value="2">出差</option>
          <option value="3">考察</option>
          <option value="4">视察</option>
          <option value="5">座谈</option>
          <option value="6">走访</option>
        </select>
		</td>
      <td width="11%" bgcolor="D0DCED">保密级别</td>
      <td width="39%" bgcolor="D0DCED"> <select name="isSecret" id="secret">
          <option><%=rs.getString("secret")%></option>
          <option value="0" >保密</option>
          <option value="1" selected>公开</option>
        </select></td>
    </tr>
    <tr> 
      <td width="14%" bgcolor="D0DCED">优先级</td>
      <td width="36%" bgcolor="D0DCED"> <select name="priority" id="priority">
          <option><%=rs.getString("priority")%></option>
          <option value="1" selected>普通</option>
          <option value="2">加急</option>
          <option value="3">特急</option>
        </select></td>
      <td width="11%" bgcolor="D0DCED">状态</td>
      <td width="39%" bgcolor="D0DCED"> <select name="isFinished" id="finish">
          <option><%=rs.getString("finish")%></option>
          <option value="false" selected>未完成</option>
          <option value="true">已完成</option>
        </select></td>
    </tr>
	 
    <tr> 
      <td width="14%" bgcolor="D0DCED">提醒类型</td>
      <td colspan="3" bgcolor="D0DCED"> 
	<select name="awakeType" id="awake">
          <option><%=rs.getString("awake")%></option>
          <option value="0" selected>不提醒</option>
          <option value="1">消息提醒</option>

		  <option value="2">短信提醒</option>
        </select> </td>
    </tr>
       <tr> 
      <td width="14%" valign="middle" bgcolor="D0DCED">内容</td>
      <td colspan="3" bgcolor="D0DCED"><textarea name="body" wrap="VIRTUAL"   style="width:100%;height:150" id="content"><%=rs.getString("content")%></textarea>      </td>
    </tr>
  </table>
  <br>
<%
rs.close();
%>
<table border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td >&nbsp;</td>
		<td width="50" align="center" valign="middle" >
			<input type="button" value="修改" onclick="jian()"></td>
	</tr>
</table>
</form>
</body>
</html>
