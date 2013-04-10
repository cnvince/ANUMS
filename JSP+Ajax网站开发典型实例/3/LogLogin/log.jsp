<%@ page language="java" import="java.util.*,com.FileBean" pageEncoding="utf-8"%>

<html>
  <head></head>
  
  <body>
  <center><h2>登录信息列表</h2></center>
  <center>
<%
	String name=request.getParameter("name");
	FileBean fb=new FileBean();
	fb.writerFile(name);       //向文件中写入登录信息
	Vector info=new Vector();
	info=fb.readFile();        //从文件中读取登录信息
	for(int j=0;j<info.size();j++)
		out.println(info.get(j).toString()+"&nbsp;&nbsp;&nbsp;");	
 %>
  </center>
  <br>
  <center>
  <%
  out.println("<a href=index.jsp>返回</a>");
   %>
  </center>
  </body>
</html>

