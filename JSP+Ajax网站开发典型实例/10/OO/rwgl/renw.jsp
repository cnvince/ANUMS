<%@ page contentType="text/html; charset=GB2312" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<html>
<head>
<title>
��������
</title>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate_form()
{
  if(document.form1.zhuti.value == "")
	{
		alert("�������ⲻ��Ϊ��!");
		return false;
	}
  if(bytelength(document.form1.zhuti.value)<1||bytelength(document.form1.zhuti.value)>50)
	{

		alert("�������ⳤ�Ȳ��Ϸ�!");
		return false;
	}
if(document.form1.wanc.value == "")
	{
		alert("���ʱ�䲻��Ϊ��");
		return false;
	}
if(document.form1.content.value == "")
	{
		alert("�������ݲ���Ϊ��");
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
   var zy=document.getElementById("zhongy");
   var zhongy=zy.options[zy.selectedIndex].text;
    var jj=document.getElementById("jinj");
   var jinj=jj.options[jj.selectedIndex].text;
    var xf=document.getElementById("xiaf");
   var xiaf=xf.options[xf.selectedIndex].text;
    var zx=document.getElementById("zhix");
   var zhix=zx.options[zx.selectedIndex].text;
    var cy=document.getElementById("cany");
   var cany=cy.options[cy.selectedIndex].text;
   var wanc=document.getElementById("wanc").value;
   var content=document.getElementById("content").value;
   var fj=document.getElementById("fj").value;
   var guanl=document.getElementById("guanl").value;
  var str="zhuti="+zhuti+"&zhongy="+zhongy+"&jinj="+jinj+"&xiaf="+xiaf+"&zhix="+zhix+"&cany="+cany+"&wanc="+wanc+"&content="+content+"&fj="+fj+"&guanl="+guanl;
   var url="../renw";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(str);
}

function callback(){
   if(xmlHttp.readyState==4){
       var str=xmlHttp.responseText;
        if(trim(str)=="1")
            { alert("�����·����");}
    }
}
</script>
</head>
<body topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">  
    <td height="13"  background="main_r.gif"><img src="guide.gif"  align="absmiddle">�������&gt;&gt;�·�����</td>
  </tr>
</table>
  <table width="100%" border="0" cellpadding="1" cellspacing="1" >
    <tr>
      <td height="12" colspan="5">&nbsp; </td>
    </tr>
	<tr>
      <td width="11%" bgcolor='C2D6EC'>��������*</td>     
      <td colspan="3"  bgcolor='C2D6EC'>
<form  method="post" action="" name="form1">
<input type="text" name="title"  id="zhuti"  style="width:80%" maxlength="50">	  
	  </td>
    </tr>
	<tr>
	  <td width="11%"  bgcolor='C2D6EC'>��Ҫ�̶�*</td>
      <td width="39%"  bgcolor='C2D6EC'>	  
	       <select name="secretLevel" id="zhongy">
	       <option value="1">һ��</option>
	       <option value="2">��Ҫ</option>
	       <option value="3">����Ҫ</option>
           </select></td>
	  <td width="11%"  bgcolor='C2D6EC'>�����̶�*</td>
	  <td width="39%"  bgcolor='C2D6EC'>
	      <select name="urgentLevel" id="jinj">
	       <option value="1">һ��</option>
	       <option value="2">��</option>
	       <option value="3">�ؼ�</option>
          </select>	  </td>
	</tr>

	<tr>
	 <td width="11%"  bgcolor='C2D6EC'>�·���</td>
	 <td colspan="3"  bgcolor='C2D6EC'>
           <select id="xiaf">
	     <%
	       String sql="select * from oa_user where gangw in('�ܾ���','���ܾ���','����','����')";
               ResultSet rs=con.getRs(sql);
               String str="";
               while(rs.next()){
                   String zhangh=rs.getString("zhangh");
                   String name=rs.getString("name");
                   String gangw=rs.getString("gangw");
                   str=zhangh+"/"+name+"/"+gangw;
                   out.print("<option>"+str+"</option>");
                } 
		%>
             </select>
	 </td>
	 </tr>

	<tr>
      <td width="11%"  bgcolor='C2D6EC'>ִ����Ա*</td>
      <td width="39%"  bgcolor='C2D6EC'>	              
	    <select id="zhix">
              <%
	       String sq="select * from oa_user where gangw not in('�ܾ���','���ܾ���','����','����')";
               ResultSet rss=con.getRs(sq);
               String strr="";
               while(rss.next()){
                   String zhangh=rss.getString("zhangh");
                   String name=rss.getString("name");
                   String gangw=rss.getString("gangw");
                   strr=zhangh+"/"+name+"/"+gangw;
                   out.print("<option>"+strr+"</option>");
                } 
		%>
            </select>
               	  </td>
	  <td width="11%"  bgcolor='C2D6EC'>������Ա</td>
	  <td width="39%" bgcolor='C2D6EC' >  
	  <select id="cany">
          <option>��</option> 
          <%
	       String sqq="select * from oa_user where gangw not in('�ܾ���','���ܾ���','����','����')";
               ResultSet rs1=con.getRs(sqq);
               String str1="";
               while(rs1.next()){
                   String zhangh=rs1.getString("zhangh");
                   String name=rs1.getString("name");
                   String gangw=rs1.getString("gangw");
                   str1=zhangh+"/"+name+"/"+gangw;
                   out.print("<option>"+str1+"</option>");
                } 
           %>
          </select>	  
	 </td>
    </tr>

    <tr>
      <td width="11%"  bgcolor='C2D6EC'>Ҫ�����ʱ��</td>
      <td width="39%"  bgcolor='C2D6EC'> 
	  <input name="endDate" type="text"   value="YY-MM-DD" maxlength="10"  size="10" id="wanc"> 
 </tr>

	<tr>
      <td width="11%" valign="top"  bgcolor='C2D6EC'>��������</td>
      <td colspan="3"  bgcolor='C2D6EC'><textarea name="content" wrap="VIRTUAL"   style="width:90%;height:150" id="content"></textarea>      </td>
    </tr>
  
  <tr>
	  <td width="11%" height="39"  bgcolor='C2D6EC'>����</td>
          <td  bgcolor='C2D6EC'><input type=file value="���" id="fj" value="��"></td>			
  	</tr>

  
  <tr>
	  <td width="11%" height="39"  bgcolor='C2D6EC'>����</td>
          <td  bgcolor='C2D6EC'><input type=text id="guanl" value="��"  bgcolor='C2D6EC'></td>			
  	</tr>
  <tr><td><input type=button value=���� onclick="jian()"></td><td><input type=reset value=����></td></tr>
  </table>

</form>
</body>
</html>
