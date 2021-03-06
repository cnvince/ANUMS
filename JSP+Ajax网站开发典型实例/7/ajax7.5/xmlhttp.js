// JavaScript Document



function createXMLHttpRequest() 
{
	var xmlHttp=false;
	if (window.ActiveXObject)                          //在IE浏览器中创建XMLHttpRequest对象
	{
		try
		{
			xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch(e)
		{
			try
			{
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP"); 
			}
			catch(ee)
			{
				xmlHttp=false;
			}
		}
		    //在IE浏览器中创建XMLHttpRequest对象
    }
	else if (window.XMLHttpRequest)                 //在非IE浏览器中创建XMLHttpRequest对象
	{
		try
		{
			xmlHttp = new XMLHttpRequest();                      
		}
		catch(e)
		{
			xmlHttp=false;
		}
    }
    
    return xmlHttp;

} 

	