<%@ page language="java" pageEncoding="gb2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户登录校验</title>
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
	if (window.ActiveXObject)                        //在IE浏览器中创建XMLHttpRequest对象
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
	else if (window.XMLHttpRequest)               //在非IE浏览器中创建XMLHttpRequest对象
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
	createXMLHttpRequest();   //调用创建XMLHttpRequest对象的方法
	xmlHttp.onreadystatechange=callback;   //设置回调函数
	nameStr=myform.name.value;
	passStr=myform.pass.value;
	var url="servlet/check?name="+nameStr+"&pass="+passStr;
	xmlHttp.open("post",url);      //向服务器端发送请求
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
                document.getElementById("state").innerHTML="已登录的用户";
                var tdName=document.getElementById("tdName");
                tdName.replaceChild(document.createTextNode(nameStr),tdName.firstChild);
                var tdPass=document.getElementById("tdPass");
                tdPass.replaceChild(document.createTextNode(passStr),tdPass.firstChild);
                var trButtom=document.getElementById("buttom");
                trButtom.innerHTML="<font color=\"red\">恭喜你成功登录</font>";
              }else{
                document.getElementById("state").innerHTML="<font color=\"red\">用户名或密码有误</font>";
              }
			}
		}		
	}
}	

</script>

 <body><br>
   <div align="center" id="display">
    <form id="form1" name="myform">
    <strong><p id="state">未登录用户</p></strong>
    <table width="300" border="1" id="table">
      <tr>
        <td>用户名：</td>
        <td id="tdName"><input type="text" id="userName" name="name" /></td>
      </tr>
      <tr>
        <td>密&nbsp;&nbsp;码：</td>
        <td id="tdPass"><input type="password" id="userPass" name="pass" /></td>
      </tr>
      <tr>
        <td colspan="2"><div align="center" id="buttom">
          <input type="button" onclick="check()" value="登录" />
          &nbsp;
          <input type="reset" name="Submit2" value="重置" />
          
        </div></td>
      </tr>
    </table>
    <p></p>
   </form>
  </div>
 </body>
</html>
