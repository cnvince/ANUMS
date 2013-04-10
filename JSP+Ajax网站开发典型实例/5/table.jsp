<%@ page language="java" pageEncoding="gb2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>以表格形式显示数据</title>
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
function xmlParse()
{
	createXMLHttpRequest();   //调用创建XMLHttpRequest对象的方法
	xmlHttp.onreadystatechange=callback;   //设置回调函数
	xmlHttp.open("post","AjaxTest.xml");      //向服务器端发送请求
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gb2312");
	xmlHttp.send(null);	
	function callback()
	{
		if(xmlHttp.readyState==4)
		{
			if(xmlHttp.status==200)
			{
               var xmlDoc = xmlHttp.responseXML;
               var friends=xmlDoc.getElementsByTagName("朋友");
               var rowSize=friends.length;
               var tab=document.createElement('table');
               tab.setAttribute("width", "450");
               tab.setAttribute("border", "1");
               for(var i=0;i <rowSize;i++){ 
                tab.insertRow(i); 
                for(var   n=0;n <3;n++){ 
                     var data=friends[i].childNodes[n].firstChild.data;
                     tab.rows[i].insertCell(n); 
                     tab.rows[i].cells[n].innerHTML=data; 
                } 
              } 
              var divNode=document.getElementById("display");
              divNode.appendChild(tab);
			}
		}		
	}
}	

</script>

  <body><br>
    <center>
       <button onclick="xmlParse()">查看通讯录</button><br><br>
       <div align="center" id="display">
       </div>
    </center>
  </body>
</html>
