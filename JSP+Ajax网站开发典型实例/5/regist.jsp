<%@ page language="java" pageEncoding="gb2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�û�ע��</title>
    <style type="text/css">
      <!--
       body {
	        background-image: url(images/img.jpg);
       }
      -->
    </style>
  </head>
<script type="text/javascript">
var xmlHttp=false;
function createXMLHttpRequest() 
{
	if (window.ActiveXObject)                        //��IE������д���XMLHttpRequest����
	{
		try{
          xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
        }
		catch(e){
			try{
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
               }
			   catch(ee){
                 xmlHttp=false;
               }
		}
    }
	else if (window.XMLHttpRequest)               //�ڷ�IE������д���XMLHttpRequest����
	{
		try{
            xmlHttp = new XMLHttpRequest();
        }
		catch(e){
            xmlHttp=false;
        }
   }
}
function checkName()
{
	createXMLHttpRequest();   //���ô���XMLHttpRequest����ķ���
	xmlHttp.onreadystatechange=callback;   //���ûص�����
	var nameStr=form1.name.value;
	var url="servlet/CheckName?name="+nameStr;
	xmlHttp.open("post",url);      //��������˷�������
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gb2312");
	xmlHttp.send(null);	
	function callback()
	{
		if(xmlHttp.readyState==4)
		{
			if(xmlHttp.status==200)
			{
              var str = xmlHttp.responseText;
              var nameText=document.getElementById("nameText");
              if(str.length==2)
              {
                var message="<font color=\"red\"><b>*�û����Ѿ����ڣ�����ѡһ��ע�ᣡ</b></font>";
                nameText.innerHTML=message;
              }else{
                var message="<b>OK</b>";
                nameText.innerHTML=message;
              }
              
            } 
		}		
	}
}	
function checkPass1()
{
  var pass1=form1.pass1.value;
  var pass1Text=document.getElementById("pass1Text");
  if(pass1.length>15||pass1.length<8)
  {
    var message="<font color=\"red\"><b>*���볤�Ȳ��Ϸ�</b></font>";
    pass1Text.innerHTML=message;
  }else
  {
    var message="<b>OK</b>";
    pass1Text.innerHTML=message;
  }
}
function checkPass2()
{
  var pass2Text=document.getElementById("pass2Text");
  if(form1.pass1.value!=form1.pass2.value)
  {
    var message="<font color=\"red\"><b>*������������벻һ��</b></font>";
    pass2Text.innerHTML=message;
  }else
  {
    var message="<b>OK</b>";
    pass2Text.innerHTML=message;
  }
}
function checkEmail()
{
  var emailText=document.getElementById("emailText");
��var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;  
��if(!pattern.test(form1.email.value))
  {
    var message="<font color=\"red\"><b>��ʽ����ȷ�����飡</b></font>";
    emailText.innerHTML=message;  
  }else
  {
    var message="<b>OK</b>";
    emailText.innerHTML=message;
  }
}

</script>

 <body><br>
   <div align="center">
  <form name="form1" method="post" action="servlet/Regist">
    <p><strong>�û�ע��</strong></p>
    <table width="500" border="1" cellpadding="2" cellspacing="2">
      <tr>
        <td>�� �� ����</td>
        <td><input name="name" type="text" size="20" onchange="checkName()"></td>
        <td><div id="nameText">��������д�������Ϊ��</div></td>
      </tr>
      <tr>
        <td>��&nbsp;&nbsp;&nbsp;&nbsp;�룺</td>
        <td><input name="pass1" type="password" size="20" onchange="checkPass1()"></td>
        <td><div id="pass1Text">���μ����룬��Ϊ���ա��绰����ȡ������Ϊ�ա�</div></td>
      </tr>
      <tr>
        <td>�ظ����룺</td>
        <td><input name="pass2" type="password" size="20" onchange="checkPass2()"></td>
        <td><div id="pass2Text">���ٴ��������룬����Ϊ�ա�</div></td>
      </tr>
      <tr>
        <td>email : </td>
        <td><input name="email" type="text" size="25" onchange="checkEmail()"></td>
        <td><div id="emailText">��ע���ʽ���磺tianmingqi@163.com</div></td>
      </tr>
      <tr>
        <td colspan="3"><div align="center">
          <input type="submit" name="Submit" value="�ύ">&nbsp;&nbsp;
          <input type="reset" name="Submit2" value="����">
         </div></td>
      </tr>
    </table>
  </form>
  </div>
 </body>
</html>
