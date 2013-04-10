<%@ page language="java" pageEncoding="gb2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�ͻ��˽���XML��ʽ�ַ���</title>
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
function xmlParse()
{
	createXMLHttpRequest();   //���ô���XMLHttpRequest����ķ���
	xmlHttp.onreadystatechange=callback;   //���ûص�����
	xmlHttp.open("get","Ajax.xml");      //��������˷�������
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gb2312");
	xmlHttp.send(null);	
	function callback()
	{
		if(xmlHttp.readyState==4)
		{
			if(xmlHttp.status==200)
			{
               var xmlDoc = xmlHttp.responseXML;
               var stus = xmlDoc.getElementsByTagName("student");
               var divNode=document.getElementById("display"); 
               for(var i = 0 ; i <stus.length;i++){ 
                 var name=stus[i].getElementsByTagName("name")[0].firstChild.data;
                 var sex=stus[i].getElementsByTagName("sex")[0].firstChild.data;
                 var age=stus[i].getElementsByTagName("age")[0].firstChild.data;
                 var pNode = document.createElement("p");
                 pNode.appendChild(document.createTextNode(name+"  "+sex+"  "+age));
                 divNode.appendChild(pNode);
               }
               
			}
		}		
	}
}	

</script>

  <body><br>
    <center>
       <button onclick="xmlParse()">����XML</button>
       <div id="display" align="center"></div>
    </center>
  </body>
</html>
