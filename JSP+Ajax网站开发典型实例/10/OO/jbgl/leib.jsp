<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="java.util.*"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate(){
   createXMLHttpRequest();

   var bm=document.getElementById("bum");
   var bum=bm.options[bm.selectedIndex].text;
   var yr=document.getElementById("year");
   var year=yr.options[yr.selectedIndex].text; 
   var mh=document.getElementById("month");
   var month=mh.options[mh.selectedIndex].text; 
 
  var str="bum="+bum+"&year="+year+"&month="+month;
     document.getElementById("xian").innerHTML="<span style='font-size:20;color:black'>"+bum+"部门"+year+"年"+month+"月员工加班列表</span><br><br>";
   var url="leib1.jsp";
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
   var ta="<table width='100%' border='0' cellpadding='0' cellspacing='1' ><tr bgcolor='DCE6F4'> <td width='30%'>加班标题</td><td width='10%'>所在处室</td><td width='10%'>加班开始时间</td><td width='10%' >加班结束时间</td></tr>";
      for(var i=0;i<yan.length;i++){
        var y=yan[i];
        ta+="<tr><td colspan=6><hr size='1' noshade='noshade' color='#000210' style='border-bottom-style:dotted' width=650 ></td></tr>";
          ta+="<tr><td bgcolor='E4EAF4'><a href='xian.jsp?id="+y.childNodes[0].firstChild.data+"' style='color:04329C;font-size:12'>"+y.childNodes[1].firstChild.data+"</a></td>";
	  ta+="<td bgcolor='E4EAF4'>"+y.childNodes[2].firstChild.data+"</td>";
          ta+="<td bgcolor='E4EAF4'>"+y.childNodes[3].firstChild.data+"</td>";
	  ta+="<td bgcolor='E4EAF4'>"+y.childNodes[4].firstChild.data+"</td>";
         ta+="</tr>";
	 }
   ta+="</table>";
   document.getElementById("res").innerHTML=ta;
   //alert(yan.length);
}
</script>
</HEAD>
<BODY topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="13" bgcolor="6C8ACC">
	<img src="guide.gif"  align="absmiddle">
    加班管理&gt;&gt;加班情况月明细列表	</td>
	<td align="right" >&nbsp;</td>
  </tr>
</table>

<form name="myform" action="" method="post">
  <table width="100%" border="0" cellpadding="0" cellspacing="1" >
    <tr>
      <td width="10%" bgcolor="D0DCED">选择部门</td>
      <td width="30%" bgcolor="D0DCED">
       <select name="bum" id="bum" >
                     <option>经理办</option>
                     <option>办公室</option>
                     <option>生产部</option>
                     <option>财务部</option>
                     <option>市场部</option>
                     <option>信息中心</option>
                  </select>
        </td>
<%
   Calendar Now = Calendar.getInstance();
   Now.setTime(new java.util.Date());
   int y=Now.get(Calendar.YEAR);
   int m=Now.get(Calendar.MONTH)+1;
   int d=Now.get(Calendar.DAY_OF_MONTH);
%>
      <td width="10%" bgcolor="D0DCED">选择时间</td>

      <td width="21%" bgcolor="D0DCED"><select name="yearId" id="year">
      <option><%=y%></option>
      <option value="2006" >2006</option>
      <option value="2007" >2007</option>
      <option value="2008" >2008</option>
      <option value="2009" >2009</option>
      <option value="2010" >2010</option>
        </select>
        年
        <select name="monthId" id="month">
        <option><%=m%></option>
        <option value="1" >1</option>
        <option value="2" >2</option>
        <option value="3" >3</option>
        <option value="4" >4</option>
        <option value="5" >5</option>
        <option value="6" >6</option>
        <option value="7" >7</option>
        <option value="8" >8</option>
        <option value="9" >9</option>
        <option value="10" >10</option>
        <option value="11" >11</option>
        <option value="12" >12</option>
        </select>
      月</td>
      <td width="0%" bgcolor="D0DCED">&nbsp;</td>
      <td width="7%" align="center" valign="middle" ><p  style="cursor:hand;color:black;font-size:12" onclick="validate()" > <u>查 询</u></p></td>
      <td width="1%" >&nbsp;</td>
      <td width="21%"></td>
    </tr>
  </table>
  </form>
<div align="left" id="xian"></div>
<div id="res"></div>
</BODY>
</HTML>
