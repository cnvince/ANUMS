<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<HTML>
<HEAD>
<TITLE>用户个人信息设置</TITLE>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type=text/javascript>
function validate_form()
{
  
if(document.form1.nc.value == "")
	{
		alert("用户昵称不能为空!");
		return false;
	}
if(document.form1.mail.value == "")
	{
		alert("电子邮件不能为空!");
		return false;
	}	
if(!verifyAddress(document.form1.mail.value)){
	  　　alert("电子邮件格式错误，请重写"); 
	      return false; 
	}
	
if(document.form1.shouj.value == "")
	{
		alert("手机号码不能为空!");
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
            { alert("基本信息修改成功");}
    }
}
</script>


</HEAD>
<body topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr bgcolor="6C8ACC">
		<td class="guide"><img src="guide.gif" align="absmiddle">
		个人设定&gt;&gt;修改个人信息</td>
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
	
		<td width="11%" >昵称</td>
		<td width="39%" ><input type="text" name="nickname"	id="nc" value=<%=rs.getString("nic")%>>
                    <span>*仅供论坛使用</span>
                </td>
	       <td width="11%">电子邮件</td>
		<td width="39%" >
                   <input type="text" name="mail" id="mail" value=<%=rs.getString("mail")%>>
		</td>

	</tr>

	<tr bgcolor="E4EAF4">
		<td width="11%" >手机</td>
		<td width="39%" ><input type="text" name="mobile" id="shouj" value=<%=rs.getString("shouj")%>>
		</td>

		<td width="11%">办公电话</td>
		<td width="39%" ><input type="text" name="bp" id="phone" value=<%=rs.getString("gphone")%>></td>
	</tr>

	<tr bgcolor="E4EAF4">

		<td width="11%" >家庭住址</td>
		<td width="39%" ><input type="text" name="homeAddress" id="zhu" value=<%=rs.getString("jzhu")%>></td>
	</tr>

        <tr >
          <td><input type="button" value="修改" onclick="reg()"></td>
           <td><input type="reset" value="重置"></td>
        </tr>

</table>
</form>

</BODY>
</HTML>
