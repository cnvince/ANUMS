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
 .aaa {
	font-weight: lighter;
	color: #000000;
	font-size: small;
}
.bbb {
	font-weight: bold;
	color: #000000;
	font-size: medium;
}
.ccc {
	font-style: italic;
	color: #000000;
	font-size: large;
	font-weight: normal;
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
               tab.setAttribute("id", "tttt");
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
              change1();
			}
		}		
	}
}	
function change1()
{document.getElementById("tttt").className="aaa";}
function change2()
{document.getElementById("tttt").className="bbb";}
function change3()
{document.getElementById("tttt").className="ccc";}
</script>

  <body onload="xmlParse()"><br>
    <center>
       <b>�����ť���Ըı�������ʾ��ʽ</b>
       <div align="center" id="display"></div>
       <p>
            <button onclick="change1()">С��ϸ��</button>
            <button onclick="change2()">�кŴ���</button>
            <button onclick="change3()">���б��</button>
          </p>
    </center>
  </body>
</html>
