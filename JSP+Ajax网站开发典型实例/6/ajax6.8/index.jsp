<%@ page contentType="text/html; charset=utf-8" %>
<% 
//接收浏览器端提交的信息
String sort=request.getParameter("sort");  
String contents1="";  
String contents2=""; 
if(sort.equals("lx"))
{  
	contents1="1.联想 天逸F41A-PT";  
	contents2="2.联想 旭日C461M-MX";  
}
else if(sort.equals("sx"))
{  
	contents1="1.三星 R18-DY0F";  contents2="2.三星 R25-B008";  }  //传回响应数据   
	response.setContentType("text/xml; charset=UTF-8");  
	response.setHeader("Cache-Control", "no-cache");  
	out.println("<response>");  
	out.println("<res>" + contents1 + "</res>");  
	out.println("<res>" + contents2 + "</res>");  
	out.println("</response>"); 
 %>