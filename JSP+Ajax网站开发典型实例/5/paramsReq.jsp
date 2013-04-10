<%@ page language="java" pageEncoding="gb2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>客户端发送带有参数请求</title>
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
function request()
{
	createXMLHttpRequest();   //调用创建XMLHttpRequest对象的方法
	xmlHttp.onreadystatechange=callback;   //设置回调函数
	var url="server2.jsp?score="+document.getElementById("myScore").value;
	xmlHttp.open("get",url);      //向服务器端发送请求
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gb2312");
	xmlHttp.send(null);	
	function callback()
	{
		if(xmlHttp.readyState==4)
		{
			if(xmlHttp.status==200)
			{
               var data= xmlHttp.responseText;
               var pNode=document.getElementById("display");
               pNode.innerHTML=data;
			}
		}		
	}
}	

</script>

  <body><br>
    <center>
       <b>学生成绩考核</b><br><br>
       请输入你的成绩：<input type="text" id="myScore"/>
       <button onclick="request()">提交</button><br><br>
       <div id="display" align="center">这里将出现对你的成绩的评价</div>
    </center>
  </body>
</html>
