<%@ page language="java" pageEncoding="gb2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�ͻ��˽�����ͨ�ַ���</title>
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
function strParse()
{
	createXMLHttpRequest();   //���ô���XMLHttpRequest����ķ���
	xmlHttp.onreadystatechange=callback;   //���ûص�����
	xmlHttp.open("post","Ajax.txt");      //��������˷�������
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gb2312");
	xmlHttp.send(null);	
	function callback()
	{
		if(xmlHttp.readyState==4)
		{
			if(xmlHttp.status==200)
			{
               var data=xmlHttp.responseText;
               var pNode=document.getElementById("display");
               pNode.innerHTML=data;
			}
		}		
	}
}	

</script>

  <body><br>
    <center>
       <button onclick="strParse()">��ͨ�ַ���</button>
       <div id="display" align="center"></div>
    </center>
  </body>
</html>
