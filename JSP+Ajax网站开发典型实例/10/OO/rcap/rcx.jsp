<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<html>
<head>
<title>
查找日程安排
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
   var zhuti=document.getElementById("zhuti").value;
    var tp=document.getElementById("type");
   var type=tp.options[tp.selectedIndex].text;
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
   var fanw=document.getElementById("fanw").checked;
   var ss="";
   if(fanw)
         {ss="本人日程";}
   else
         {ss="他人日程";}
    
   var finish=document.getElementById("finish").checked;
   var wanc="";
   if(finish)
        {wanc="未完成";}
   else{wanc="已完成";}
   var str="zhuti="+zhuti+"&starttime="+starttime+"&starthour="+starthour+"&startminute="+startminute+"&endtime="+endtime+"&endhour="+endhour+"&endminute="+endminute+"&type="+type+"&finish="+wanc+"&fanw="+ss;
   var url="rcx1.jsp";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(str);
}

function callback(){
   if(xmlHttp.readyState==4){
     show();
    }
}
function show(){
   var xmlDoc=xmlHttp.responseXML;
   var yan=xmlDoc.getElementsByTagName("content");
   var ta="<table width='100%' border='0' cellpadding='0' cellspacing='1' ><tr bgcolor='BCCEED'> <td width='30%'>主题</td><td width='10%'>开始时间</td><td width='10%'>结束时间</td><td width='10%' >种 类</td><td width='10%'>优先级</td><td width='10%' >完 成</td><td width='10%'>发布人</td></tr>";
      for(var i=0;i<yan.length;i++){
        var y=yan[i];
        ta+="<tr><td colspan=6></td></tr>";
          ta+="<tr bgcolor='E4EAF4'><td><a href='ric.jsp?id="+y.childNodes[0].firstChild.data+"'>"+y.childNodes[1].firstChild.data+"</a></td>";
	  ta+="<td>"+y.childNodes[2].firstChild.data+"</td>";
          ta+="<td>"+y.childNodes[3].firstChild.data+"</td>";
	  ta+="<td>"+y.childNodes[4].firstChild.data+"</td>";
          ta+="<td>"+y.childNodes[5].firstChild.data+"</td>";
          ta+="<td>"+y.childNodes[6].firstChild.data+"</td>";
          ta+="<td>"+y.childNodes[7].firstChild.data+"</td>";
         ta+="</tr>";
	 }
   ta+="</table>";
   document.getElementById("res").innerHTML=ta;
   //alert(yan.length);
}
</script>
</head>
<body topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
    <td height="13" > <img src="guide.gif"  align="absmiddle">
      日程安排&gt;&gt;查询</td>
	  <td align="right" >&nbsp;</td>
  </tr>
</table>
<br>  
<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" >
  <form name="form1" method="post" action="">
    <tr> 
      <td width="13%" bgcolor="BCCEED">主题</td>
      <td width="37%" bgcolor="BCCEED"><input name="subject" type="text" id="zhuti"></td>
      <td width="13%" bgcolor="BCCEED">类型</td>
      <td width="37%" bgcolor="BCCEED">
        <select name="arrTypeID" id="type">
          <option value="-1" selected>不限</option>
          <option value="0">开会</option>
          <option value="1">宴会</option>
          <option value="2">出差</option>
          <option value="3">考察</option>
          <option value="4">视察</option>
          <option value="5">座谈</option>
          <option value="6">走访</option>
        </select></td>
    </tr>
    <!--  -->
    <tr> 
      <td width="14%" bgcolor="BCCEED">时间 从</td>
      <td width="36%" bgcolor="BCCEED">
        <%
   Calendar Now = Calendar.getInstance();
   Now.setTime(new java.util.Date());
   int y=Now.get(Calendar.YEAR);
   int m=Now.get(Calendar.MONTH)+1;
   int d=Now.get(Calendar.DAY_OF_MONTH);
   String str=y+"-"+m+"-"+d;
          %>
	  <input name="startDate" type="text"   value=<%=str%>  maxlength="10"  size="10" id="starttime"> 
	  	<select name="startHour" id="starthour">
		    <option value="0">00</option>
                    <option value="1">01</option>
                    <option value="2">02</option>
                    <option value="3">03</option>
                    <option value="4">04</option>
                    <option value="5">05</option>
                    <option value="6">06</option>
                    <option value="7">07</option>
                    <option value="8" selected>08</option>
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
		<select name="startMinute" id="startminute">
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
		</select>
      </td>
      <td width="11%" bgcolor="BCCEED">到</td>
      <td width="39%" bgcolor="BCCEED">
	  <input name="endDate" type="text"   value=<%=str%>  maxlength="10"  size="10" id="endtime"> 
	<select name="endHour" id="endhour">
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
		</select>
      </td>
    </tr>
    	
    <tr> 
      <td width="13%" bgcolor="BCCEED">查找范围</td>
      <td bgcolor="BCCEED"> 
	  <input type="radio" name="queryRange"  value="0" id="fanw" checked>本人日程
	  <input type="radio" name="queryRange" value="1" id="fanw">他人日程
	  </td>
      <td bgcolor="BCCEED">状态</td>
      <td bgcolor="BCCEED"><input type="radio" name="isFinished" value="0"  id="finish" checked>尚未完成 &nbsp; 
           <input type="radio" name="isFinished" value="1" id="finish"> 已完成
    </td>
    </tr>
   <tr><td><input type=button value="查询" onclick="jian()"></td><td><input type=reset value="重置"></td></tr>
  </form>
</table>
<div id="res"></div>
</body>
</html>
