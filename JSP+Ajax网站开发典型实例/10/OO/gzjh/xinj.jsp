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
		alert("�ƻ����Ʋ���Ϊ��!");
		return false;
	}
  if(bytelength(document.form1.title.value)<1||bytelength(document.form1.title.value)>50)
	{

		alert("�ƻ����Ƴ��Ȳ��Ϸ�!");
		return false;
	}
 if(document.form1.dtime.value == "")
	{
		alert("�ƻ�ʱ�䲻��Ϊ��");
		return false;
	}
if(document.form1.content.value == "")
	{
		alert("�ƻ����ݲ���Ϊ��!");
		return false;
	}
if(document.form1.zhix.value == "")
	{
		alert("�ƻ�ִ�������Ҫ��д");
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
            { alert("�ƻ��������");}
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
    �����ƻ� &gt;&gt;�ƶ��ƻ�
	</td>
  </tr>
</table>

	<form name="form1" method="post">

  <table width="100%" border="0" cellpadding="1" cellspacing="1" class="maintable">
    <tr>
      <td colspan="4" class="head">&nbsp;</td>
    </tr>
    <tr>
      <td width="11%" bgcolor="D0DCED">����*</td>
      <td colspan="3" bgcolor="D0DCED"><input type="text" name="title" size="60" id="title"></td>
    </tr>    <tr>
<%
if(gangw.equals("�ܾ���") | gangw.equals("���ܾ���"))
{
%>
      <td width="11%" bgcolor="D0DCED">���</td>
      <td width="39%" bgcolor="D0DCED">
        <select name="rangeTypeXid" id="leib">
          <option value="1" >���˼ƻ�</option>
          <option value="1" >���żƻ�</option>
          <option value="1" >��λ�ƻ�</option>
        </select> </td>
<%
}
else if(gangw.equals("����") | gangw.equals("����")){
%>
  <td width="11%" bgcolor="D0DCED">���</td>
      <td width="39%" bgcolor="D0DCED"> <select name="rangeTypeXid" id="leib">
          <option value="1" >���˼ƻ�</option>
          <option value="1" >���żƻ�</option>
        </select> </td>
<%}
else{
%>
  <td width="11%" bgcolor="D0DCED">���</td>
      <td width="39%" bgcolor="D0DCED"> <select name="rangeTypeXid" id="leib">
          <option value="1" >���˼ƻ�</option>
        </select> </td>
<% }%>


      <td width="11%" bgcolor="D0DCED">��Χ</td>
      <td width="39%" bgcolor="D0DCED">
	  <select name="rangeTypeDept" id="fanw">
                <option>��</option>
                <option>����</option>
                <option>��λ</option>
          </select> 
          </td>
    </tr>
   
    <tr>
      <td width="11%" bgcolor="D0DCED">����</td>
      <td width="39%" bgcolor="D0DCED"> <select name="levelXid" id="jb">
          <option value="1"  selected >��ͨ</option>
          <option value="2"  >��Ҫ</option>
        </select> </td>
      <td  bgcolor="D0DCED">״̬</td>
      <td bgcolor="D0DCED"> <select name="statusXid" id="zhuangt">
          <option value="1" selected >δ���</option>
          <option value="2" >���</option>
        </select> </td>
    </tr>
   
    <tr>
      <td width="11%" bgcolor="D0DCED">ʱ�����</td>
      <td colspan="3" bgcolor="D0DCED"><select name="timeTypeXid" id="sl">
          <!--<option value="1"  selected >�ռƻ�</option>-->
          <option value="2" >�ܼƻ�</option>
          <option value="3" >�¼ƻ�</option>
		   <option value="5" >���ȼƻ�</option>
          <option value="4" >��ƻ�</option>
        </select> </td>
    </tr>
    <tr id="idWeek" >
      <td width="11%" bgcolor="D0DCED">ʱ��(��)</td>
      <td colspan="3" bgcolor="D0DCED">
	 
	  <input type="text"  name="showTime" size="40" value="2008-5-4 �� 2008-5-10" id="dtime">
        <a href="calendar.jsp" target="bottom" > <img src="calendar.gif" alt="ѡ��ʱ��" border="0" align="absmiddle"></a>		</td>
     </tr>
    <tr>
      <td width="11%" bgcolor="D0DCED">����*</td>
      <td colspan="3" bgcolor="D0DCED"><textarea name="content" style="width:100%;height:80" id="content"></textarea></td>
    </tr>
	<tr>
      <td width="11%" bgcolor="D0DCED">ִ�����</td>
      <td colspan="3" bgcolor="D0DCED"><textarea name="execution" style="width:100%;height:80" id="zhix"></textarea></td>
    </tr>
   <tr>
      <td width="11%" bgcolor="D0DCED">����</td>
      <td colspan="3" bgcolor="D0DCED">
	  	<input name="attachment" type="file" id="fj">&nbsp;	   </td>
    </tr> 
  </table>
 <table width="100%" border="0" cellpadding="1" cellspacing="1" >
   <tr>
    <td width="11%" bgcolor="D0DCED">����</td>
    <td width="89%" bgcolor="D0DCED">
     <select id="gl">
           <option>��</option>
           <option>�����</option>
           <option>�칫��</option>
           <option>������</option>
           <option>����</option>
           <option>�г���</option>
           <option>��Ϣ����</option>
       </select>
          </td>
    </tr>
     <tr>
    <td ><input type=button onclick="jian()" value="�ύ"></td>
    <td > <input type=reset value=����></td>
    </tr>
 </table>
 </form>
</body>
</html>
