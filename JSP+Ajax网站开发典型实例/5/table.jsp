<%@ page language="java" pageEncoding="gb2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�Ա����ʽ��ʾ����</title>
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
	xmlHttp.open("post","AjaxTest.xml");      //��������˷�������
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gb2312");
	xmlHttp.send(null);	
	function callback()
	{
		if(xmlHttp.readyState==4)
		{
			if(xmlHttp.status==200)
			{
               var xmlDoc = xmlHttp.responseXML;
               var friends=xmlDoc.getElementsByTagName("����");
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
       <button onclick="xmlParse()">�鿴ͨѶ¼</button><br><br>
       <div align="center" id="display">
       </div>
    </center>
  </body>
</html>
