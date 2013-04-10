<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
int startnum=0;
String tempvalue="";
try
{
	startnum=Integer.parseInt(request.getParameter("startnum"));   //获得客户端发送过来的参数值
	for(int j=startnum;j<=9999;j++)            //获得从startnum到9999之间以startnum开头的数字
	{
		String temp=String.valueOf(j);
		if(temp.startsWith(String.valueOf(startnum)))
			tempvalue=tempvalue.concat(temp+"\n");
	}
	out.print(tempvalue);	   //向客户端输出信息
}
catch(Exception e)
{
	out.print("");
}
%>

