<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<html>
<head>
<title>
�½��ճ̰���
</title> 
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate_form()
{
  if(document.form1.zhuti.value == "")
	{
		alert("���ⲻ��Ϊ��!");
		return false;
	}
  if(bytelength(document.form1.zhuti.value)<1||bytelength(document.form1.zhuti.value)>25)
	{

		alert("���ⳤ�Ȳ��Ϸ�!");
		return false;
	}

if(document.form1.content.value == "")
	{
		alert("�ճ̰��Ų���Ϊ��");
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
    
  var str="zhuti="+zhuti+"&starttime="+starttime+"&starthour="+starthour+"&startminute="+startminute+"&endtime="+endtime+"&endhour="+endhour+"&endminute="+endminute+"&type="+type+"&secret="+secret+"&priority="+priority+"&finish="+finish+"&awake="+awake+"&content="+content;
   var url="../richeng";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(str);
}

function callback(){
   if(xmlHttp.readyState==4){
       var str=xmlHttp.responseText;
        if(trim(str)=="1")
            { alert("�ճ��¼��������");}
    }
}
</script>
</head>

<body topmargin="0" >
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
    <td height="13"  class="guide"> <img src="guide.gif"  align="absmiddle">
	�ճ̰���&gt;&gt;�½��¼�</td>
	<td align="right"   >&nbsp;</td>
  </tr>
</table>

<form name="form1" method="post" action="">


  <table width="100%" border="0" cellpadding="1" cellspacing="1" >
  
	<tr> 
      <td width="14%" bgcolor="C2D6EC">����*</td>
      <td colspan="3" bgcolor="C2D6EC"> <input name="subject" type="text"  style="width:80%" size="65" maxlength="50" id="zhuti">      </td>
    </tr>
	<%
   Calendar rightNow = Calendar.getInstance();
   rightNow.setTime(new java.util.Date());
   int year=rightNow.get(Calendar.YEAR);
   int month=rightNow.get(Calendar.MONTH)+1;
   int day=rightNow.get(Calendar.DAY_OF_MONTH);
   String dates=request.getParameter("datt");
   if(dates==null)
      dates=year+"-"+month+"-"+day;
%>
    <tr> 
      <td width="14%" bgcolor="C2D6EC">��ʼʱ��</td>
      <td width="36%" bgcolor="C2D6EC"> 
	  <input name="startDate" type="text"   value=<%=dates%>  maxlength="10" readonly size="10" id="starttime"> 
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
		</select>��  
		<select name="startMinute"  id="startminute">
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
      <td width="11%" bgcolor="C2D6EC">����ʱ��</td>
      <td width="39%" bgcolor="C2D6EC"> 
	  <input name="endDate" type="text" class="field"  value=<%=dates%> maxlength="10" readonly size="10" id="endtime">
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
				</select>��
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
		</select>      </td>
    </tr>
   
    <tr> 
      <td width="14%" bgcolor="C2D6EC">����</td>
      <td width="36%"bgcolor="C2D6EC"> <select name="arrTypeID" id="type">
          <option value="0">����</option>
          <option value="1">���</option>
          <option value="2">����</option>
          <option value="3">����</option>
          <option value="4">�Ӳ�</option>
          <option value="5">��̸</option>
          <option value="6">�߷�</option>
        </select>
		</td>
      <td width="11%" bgcolor="C2D6EC">���ܼ���</td>
      <td width="39%" bgcolor="C2D6EC"> <select name="isSecret" id="secret">
          <option value="0" >����</option>
          <option value="1" selected>����</option>
        </select></td>
    </tr>
    <tr> 
      <td width="14%" bgcolor="C2D6EC">���ȼ�</td>
      <td width="36%" bgcolor="C2D6EC"> <select name="priority" id="priority">
          <option value="1" selected>��ͨ</option>
          <option value="2">�Ӽ�</option>
          <option value="3">�ؼ�</option>
        </select></td>
      <td width="11%" bgcolor="C2D6EC">״̬</td>
      <td width="39%" bgcolor="C2D6EC"> <select name="isFinished" id="finish">
          <option value="false" selected>δ���</option>
          <option value="true">�����</option>
        </select></td>
    </tr>
	 
    <tr> 
      <td width="14%" bgcolor="C2D6EC">��������</td>
      <td colspan="3" bgcolor="C2D6EC"> 
		<select name="awakeType" id="awake">
          <option value="0" selected>������</option>
          <option value="1">��Ϣ����</option>

		  <option value="2">��������</option>
        </select> </td>
    </tr>
       <tr> 
      <td width="14%" valign="middle" bgcolor="C2D6EC">����</td>
      <td colspan="3" bgcolor="C2D6EC"><textarea name="body" wrap="VIRTUAL"   style="width:100%;height:150" id="content"></textarea>      </td>
    </tr>
  </table>
  <br>
<table border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td >&nbsp;</td>
		<td width="50" align="center" valign="middle" >
			<input type="button" value="�� ��" onclick="jian()"></td>
		<td align="right" >&nbsp;</td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td width="50" align="center" valign="middle" >
			<input type="reset" value="ȡ ��"></td>
		<td align="right" class="buttonbg">&nbsp;</td>
	</tr>
</table>
</form>
</body>
</html>
