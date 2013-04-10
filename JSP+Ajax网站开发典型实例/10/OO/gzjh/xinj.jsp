<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<html>
<head>
<title>menu</title>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate_form()
{
  if(document.form1.title.value == "")
	{
		alert("计划名称不能为空!");
		return false;
	}
  if(bytelength(document.form1.title.value)<1||bytelength(document.form1.title.value)>50)
	{

		alert("计划名称长度不合法!");
		return false;
	}
 if(document.form1.dtime.value == "")
	{
		alert("计划时间不能为空");
		return false;
	}
if(document.form1.content.value == "")
	{
		alert("计划内容不能为空!");
		return false;
	}
if(document.form1.zhix.value == "")
	{
		alert("计划执行情况需要填写");
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
   var mc=document.getElementById("title").value;
   var lb=document.getElementById("leib");
   var leib=lb.options[lb.selectedIndex].text;
    var fw=document.getElementById("fanw");
   var fanw=fw.options[fw.selectedIndex].text;
    var jh=document.getElementById("jb");
   var jb=jh.options[jh.selectedIndex].text;
    var zt=document.getElementById("zhuangt");
   var zhuangt=zt.options[zt.selectedIndex].text;
    var sss=document.getElementById("sl");
   var sl=sss.options[sss.selectedIndex].text;
   var dtime=document.getElementById("dtime").value;
   var content=document.getElementById("content").value;
   var zhix=document.getElementById("zhix").value;
   var fj=document.getElementById("fj").value;
  var g=document.getElementById("gl");
   var gl=g.options[g.selectedIndex].text;
   var bum=document.getElementById("bum").value;
    var str="mc="+mc+"&leib="+leib+"&fanw="+fanw+"&jb="+jb+"&zhuangt="+zhuangt+"&sl="+sl+"&dtime="+dtime+"&content="+content+"&zhix="+zhix+"&fj="+fj+"&gl="+gl+"&bum="+bum;
   var url="../jh";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(str);
}

function callback(){
   if(xmlHttp.readyState==4){
       var str=xmlHttp.responseText;
        if(trim(str)=="1")
            { alert("计划创建完毕");}
    }
}
</script>




</head>
<body  topmargin="0">
<%
String strr=(String)session.getAttribute("name");
String sql="select * from oa_user where zhangh='"+strr+"'";
ResultSet rs=con.getRs(sql);
rs.next();
String bum=rs.getString("bum");
String gangw=rs.getString("gangw");
%>
<input type="hidden" name="bum" id="bum" value=<%=bum%>>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
    <td height="13"><img src="guide.gif"  align="absmiddle">
    工作计划 &gt;&gt;制定计划
	</td>
  </tr>
</table>

	<form name="form1" method="post">

  <table width="100%" border="0" cellpadding="1" cellspacing="1" class="maintable">
    <tr>
      <td colspan="4" class="head">&nbsp;</td>
    </tr>
    <tr>
      <td width="11%" bgcolor="D0DCED">名称*</td>
      <td colspan="3" bgcolor="D0DCED"><input type="text" name="title" size="60" id="title"></td>
    </tr>    <tr>
<%
if(gangw.equals("总经理") | gangw.equals("副总经理"))
{
%>
      <td width="11%" bgcolor="D0DCED">类别</td>
      <td width="39%" bgcolor="D0DCED">
        <select name="rangeTypeXid" id="leib">
          <option value="1" >个人计划</option>
          <option value="1" >部门计划</option>
          <option value="1" >单位计划</option>
        </select> </td>
<%
}
else if(gangw.equals("主任") | gangw.equals("经理")){
%>
  <td width="11%" bgcolor="D0DCED">类别</td>
      <td width="39%" bgcolor="D0DCED"> <select name="rangeTypeXid" id="leib">
          <option value="1" >个人计划</option>
          <option value="1" >部门计划</option>
        </select> </td>
<%}
else{
%>
  <td width="11%" bgcolor="D0DCED">类别</td>
      <td width="39%" bgcolor="D0DCED"> <select name="rangeTypeXid" id="leib">
          <option value="1" >个人计划</option>
        </select> </td>
<% }%>


      <td width="11%" bgcolor="D0DCED">范围</td>
      <td width="39%" bgcolor="D0DCED">
	  <select name="rangeTypeDept" id="fanw">
                <option>无</option>
                <option>部门</option>
                <option>单位</option>
          </select> 
          </td>
    </tr>
   
    <tr>
      <td width="11%" bgcolor="D0DCED">级别</td>
      <td width="39%" bgcolor="D0DCED"> <select name="levelXid" id="jb">
          <option value="1"  selected >普通</option>
          <option value="2"  >重要</option>
        </select> </td>
      <td  bgcolor="D0DCED">状态</td>
      <td bgcolor="D0DCED"> <select name="statusXid" id="zhuangt">
          <option value="1" selected >未完成</option>
          <option value="2" >完成</option>
        </select> </td>
    </tr>
   
    <tr>
      <td width="11%" bgcolor="D0DCED">时间类别</td>
      <td colspan="3" bgcolor="D0DCED"><select name="timeTypeXid" id="sl">
          <!--<option value="1"  selected >日计划</option>-->
          <option value="2" >周计划</option>
          <option value="3" >月计划</option>
		   <option value="5" >季度计划</option>
          <option value="4" >年计划</option>
        </select> </td>
    </tr>
    <tr id="idWeek" >
      <td width="11%" bgcolor="D0DCED">时间(周)</td>
      <td colspan="3" bgcolor="D0DCED">
	 
	  <input type="text"  name="showTime" size="40" value="2008-5-4 到 2008-5-10" id="dtime">
        <a href="calendar.jsp" target="bottom" > <img src="calendar.gif" alt="选择时间" border="0" align="absmiddle"></a>		</td>
     </tr>
    <tr>
      <td width="11%" bgcolor="D0DCED">内容*</td>
      <td colspan="3" bgcolor="D0DCED"><textarea name="content" style="width:100%;height:80" id="content"></textarea></td>
    </tr>
	<tr>
      <td width="11%" bgcolor="D0DCED">执行情况</td>
      <td colspan="3" bgcolor="D0DCED"><textarea name="execution" style="width:100%;height:80" id="zhix"></textarea></td>
    </tr>
   <tr>
      <td width="11%" bgcolor="D0DCED">附件</td>
      <td colspan="3" bgcolor="D0DCED">
	  	<input name="attachment" type="file" id="fj">&nbsp;	   </td>
    </tr> 
  </table>
 <table width="100%" border="0" cellpadding="1" cellspacing="1" >
   <tr>
    <td width="11%" bgcolor="D0DCED">关联</td>
    <td width="89%" bgcolor="D0DCED">
     <select id="gl">
           <option>无</option>
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
    <td ><input type=button onclick="jian()" value="提交"></td>
    <td > <input type=reset value=重置></td>
    </tr>
 </table>
 </form>
</body>
</html>
