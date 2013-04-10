<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
int count=Integer.parseInt(request.getParameter("count"));
String percent="0";
switch(count)
{
	case 1:percent = "10";break;
	case 2:percent = "23";break;
	case 3:percent = "35";break;
	case 4:percent = "51";break;
	case 5:percent = "64";break;
	case 6:percent = "73";break;
	case 7:percent = "89";break;
	case 8:percent = "100";break;
}
out.print(percent);
 %>
