<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<html>
<head>
<title>��־��ѯ </title>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate_form()
{
  if(document.form1.title.value == "")
	{
		alert("���ⲻ��Ϊ��!");
		return false;
	}
  if(bytelength(document.form1.title.value)<1||bytelength(document.form1.title.value)>25)
	{

		alert("���ⳤ�Ȳ��Ϸ�!");
		return false;
	}
 if(document.form1.starttime.value == "")
	{
		alert("��־ʱ�䲻��Ϊ��!");
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
   var starttime=document.getElementById("starttime").value;
    var tp=document.getElementById("type");
   var type=tp.options[tp.selectedIndex].text;
   var range=document.getElementById("range").checked;
   var ss="";
   if(range)
         {ss="������־";}
   else
         {ss="������־";}
   var str="title="+title+"&starttime="+starttime+"&type="+type+"&range="+ss;
   var url="cha1.jsp";
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
   var ta="<table width='100%' border='0' cellpadding='0' cellspacing='1' ><tr bgcolor='BCCEED'> <td width='30%'>����</td><td width='10%' >��־ʱ��</td><td width='10%'>��д��</td></tr>";
      for(var i=0;i<yan.length;i++){
        var y=yan[i];
        ta+="<tr ><td colspan=6></td></tr>";
          ta+="<tr bgcolor='E4EAF4'><td><a href='rizx.jsp?id="+y.childNodes[0].firstChild.data+"' style='color:04329C'>"+y.childNodes[1].firstChild.data+"</a></td>";
	  ta+="<td>"+y.childNodes[2].firstChild.data+"</td>";
          ta+="<td>"+y.childNodes[3].firstChild.data+"</td>";
         ta+="</tr>";
	 }
   ta+="</table>";
   document.getElementById("res").innerHTML=ta;
   //alert(yan.length);
}
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
    <td ><img src="guide.gif" align="absmiddle">
      ��־&gt;&gt;��־��ѯ</td>
	  <td align="right" >&nbsp;</td>
  </tr>
	</table>
<form name="form1" method="post" action="listresult.jsp">

  <table width="100%" border="0" cellpadding="1" cellspacing="1" >
    <tr bgcolor='BCCEED'>
      <td >����</td>
      <td colspan="3" > <input name="title" type="text" id="title" size="92"> </td>
    </tr>
    <tr bgcolor='BCCEED'>
      <td width="11%" >��־ʱ��</td>
<%
 Calendar Now = Calendar.getInstance();
   Now.setTime(new java.util.Date());
   int y=Now.get(Calendar.YEAR);
   int m=Now.get(Calendar.MONTH)+1;
   int d=Now.get(Calendar.DAY_OF_MONTH);
   String str=y+"-"+m+"-"+d;
%>
      <td width="39%" > <input name="startTime" type="text" id="starttime" size="20" value=<%=str%>>
  </td>
      <td >��־����</td>
      <td ><select name="typeXID" id="type">
          <option value="-1">ȫ������</option>
          <option value=0>�����ܽ�</option>
          <option value=1>�����ƻ�</option>
          <option value=2>�����ĵ�</option>
      </select></td>
    </tr>
    <tr bgcolor='BCCEED'>
      <td >��ѯ��Χ</td>
      <td >
	  <input type="radio" name="queryRange" id="range"  checked value="0">������־
	  <input type="radio" name="queryRange" id="range"  value="1">������־	  </td>
        </tr>
<tr>
<%
  String sessionname=(String)session.getAttribute("name");
  String sqq="select gangw from oa_user where zhangh='"+sessionname+"'";
  ResultSet rss=con.getRs(sqq);
  rss.next();
  String gangw=rss.getString("gangw");
  if(gangw.equals("�ܾ���") | gangw.equals("���ܾ���") | gangw.equals("����") | gangw.equals("����")){
%>
<td><input type=button value=��ѯ onclick="jian()"></td><td><input type=reset value=ȡ��></td></tr>
<%}else{%>
<td><input type=button value=��ѯ onclick="alert('���߱���ѯȨ��');"></td><td><input type=reset value=ȡ��></td></tr>
<%}%>
  </table>
</form>
<div id="res"></div>
</html>
