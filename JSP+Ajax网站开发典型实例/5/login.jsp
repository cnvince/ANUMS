<%@ page language="java" pageEncoding="gb2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�û���¼У��</title>
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
var nameStr,passStr;
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
function check()
{
	createXMLHttpRequest();   //���ô���XMLHttpRequest����ķ���
	xmlHttp.onreadystatechange=callback;   //���ûص�����
	nameStr=myform.name.value;
	passStr=myform.pass.value;
	var url="servlet/check?name="+nameStr+"&pass="+passStr;
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
              if(str.length==2){
                document.getElementById("state").innerHTML="�ѵ�¼���û�";
                var tdName=document.getElementById("tdName");
                tdName.replaceChild(document.createTextNode(nameStr),tdName.firstChild);
                var tdPass=document.getElementById("tdPass");
                tdPass.replaceChild(document.createTextNode(passStr),tdPass.firstChild);
                var trButtom=document.getElementById("buttom");
                trButtom.innerHTML="<font color=\"red\">��ϲ��ɹ���¼</font>";
              }else{
                document.getElementById("state").innerHTML="<font color=\"red\">�û�������������</font>";
              }
			}
		}		
	}
}	

</script>

 <body><br>
   <div align="center" id="display">
    <form id="form1" name="myform">
    <strong><p id="state">δ��¼�û�</p></strong>
    <table width="300" border="1" id="table">
      <tr>
        <td>�û�����</td>
        <td id="tdName"><input type="text" id="userName" name="name" /></td>
      </tr>
      <tr>
        <td>��&nbsp;&nbsp;�룺</td>
        <td id="tdPass"><input type="password" id="userPass" name="pass" /></td>
      </tr>
      <tr>
        <td colspan="2"><div align="center" id="buttom">
          <input type="button" onclick="check()" value="��¼" />
          &nbsp;
          <input type="reset" name="Submit2" value="����" />
          
        </div></td>
      </tr>
    </table>
    <p></p>
   </form>
  </div>
 </body>
</html>
