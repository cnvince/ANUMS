<%@ page language="java" pageEncoding="gb2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>��һ��Ajaxʵ��</title>
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
function hello()
{
	createXMLHttpRequest();   //���ô���XMLHttpRequest����ķ���
	xmlHttp.onreadystatechange=callback;   //���ûص�����
	xmlHttp.open("get","HelloAjaxDo.jsp");      //��������˷�������
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gb2312");
	xmlHttp.send(null);	
	function callback()
	{
		if(xmlHttp.readyState==4)
		{
			if(xmlHttp.status==200)
			{
               var data= xmlHttp.responseText;
               var pNode=document.getElementById("p");
               pNode.innerHTML=data;
			}
		}		
	}
}	

</script>
  <body><br>
    <center>
       <button onclick="hello()">Ajax</button>
       <P id="p">
           ������ť������о���ķ���Ӵ��
       </P>
    </center>
  </body>
</html>
