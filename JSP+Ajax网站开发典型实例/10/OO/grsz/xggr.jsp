<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<HTML>
<HEAD>
<TITLE>�û�������Ϣ����</TITLE>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate_form()
{
  
if(document.form1.nc.value == "")
	{
		alert("�û��ǳƲ���Ϊ��!");
		return false;
	}
if(document.form1.mail.value == "")
	{
		alert("�����ʼ�����Ϊ��!");
		return false;
	}	
if(!verifyAddress(document.form1.mail.value)){
	  ����alert("�����ʼ���ʽ��������д"); 
	      return false; 
	}
	
if(document.form1.shouj.value == "")
	{
		alert("�ֻ����벻��Ϊ��!");
		return false;
	}	
	
if(!CheckPhone85(document.form1.shouj.value)){
	       return false;
	}
       return true;
}


function reg()
{
	if(validate_form()==false)
		return;
	validate();
}


function validate(){
   createXMLHttpRequest();
  
   var nc=document.getElementById("nc").value;
   var mail=document.getElementById("mail").value;
   var shouj=document.getElementById("shouj").value;
   var phone=document.getElementById("phone").value;
   var zhu=document.getElementById("zhu").value;
   
   var str="nc="+nc+"&mail="+mail+"&shouj="+shouj+"&phone="+phone+"&zhu="+zhu;
   var url="xggr1.jsp";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(str);
}

function callback(){
   if(xmlHttp.readyState==4){
       var str=xmlHttp.responseText;
        if(trim(str)=="1")
            { alert("������Ϣ�޸ĳɹ�");}
    }
}
</script>


</HEAD>
<body topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr bgcolor="6C8ACC">
		<td class="guide"><img src="guide.gif" align="absmiddle">
		�����趨&gt;&gt;�޸ĸ�����Ϣ</td>
		<td align="right" class="guide">&nbsp;</td>
	</tr>
</table>
<%
 String name=(String)session.getAttribute("name");
 String sql="select * from oa_user where zhangh='"+name+"'";
 ResultSet rs=con.getRs(sql);
 rs.next();
%>
<form method="post"  name="form1">

<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
	<tr bgcolor="E4EAF4">
	
		<td width="11%" >�ǳ�</td>
		<td width="39%" ><input type="text" name="nickname"	id="nc" value=<%=rs.getString("nic")%>>
                    <span>*������̳ʹ��</span>
                </td>
	       <td width="11%">�����ʼ�</td>
		<td width="39%" >
                   <input type="text" name="mail" id="mail" value=<%=rs.getString("mail")%>>
		</td>

	</tr>

	<tr bgcolor="E4EAF4">
		<td width="11%" >�ֻ�</td>
		<td width="39%" ><input type="text" name="mobile" id="shouj" value=<%=rs.getString("shouj")%>>
		</td>

		<td width="11%">�칫�绰</td>
		<td width="39%" ><input type="text" name="bp" id="phone" value=<%=rs.getString("gphone")%>></td>
	</tr>

	<tr bgcolor="E4EAF4">

		<td width="11%" >��ͥסַ</td>
		<td width="39%" ><input type="text" name="homeAddress" id="zhu" value=<%=rs.getString("jzhu")%>></td>
	</tr>

        <tr >
          <td><input type="button" value="�޸�" onclick="reg()"></td>
           <td><input type="reset" value="����"></td>
        </tr>

</table>
</form>

</BODY>
</HTML>
