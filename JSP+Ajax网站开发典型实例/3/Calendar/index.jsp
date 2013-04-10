<%@ page language="java" import="com.*"  pageEncoding="utf-8"%>
 
<%!
String year; 
String month; 
%> 

<% 
CalendarOP co=new CalendarOP();
CalendarBean cb=new CalendarBean();
month=request.getParameter("month"); 
year =request.getParameter("year");
if(month==null||month=="")
	month=String.valueOf(co.firstGetM());
if(year==null||year=="")
    year=String.valueOf(co.firstGetY());
cb=co.getCalendarBean(month,year);
%> 
<html> 
<head></head> 
<body> 
<FORM name="sm" method="post" action="index.jsp"> 
<table border="0" width="168" height="20" align="center"> 
<tr> 
<td width=28%><input type=text name="year" value=<% if(year==null||year.equals("")||year.equals("null")) out.print(cb.getCurryear()); else out.print(year);%> size=4 maxlength=4></td> 
<td>年</td> 
<td width=30%><select name="month" size="1" > 
<option value="0">一月</option> 
<option value="1">二月</option> 
<option value="2">三月</option> 
<option value="3">四月</option> 
<option value="4">五月</option> 
<option value="5">六月</option> 
<option value="6">七月</option> 
<option value="7">八月</option> 
<option value="8">九月</option> 
<option value="9">十月</option> 
<option value="10">十一月</option> 
<option value="11">十二月</option> 
</select></td> 
<td width=28%><input type=submit value="显示"></td> 
</tr> 
</table> 
<table border="0" width="168" height="81" align="center"> 
<tr bgcolor="#3399FF"> 
<th width="25" height="16">日</th> 
<th width="25" height="16">一</th> 
<th width="25" height="16">二</th> 
<th width="25" height="16">三</th> 
<th width="25" height="16">四</th> 
<th width="25" height="16">五</th> 
<th width="25" height="16">六</th> 
</tr> 
<% for(int j=0;j<6;j++) { %> 
<tr> 
<% for(int i=j*7;i<(j+1)*7;i++) { %> 
<td width="15%" height="16" bgcolor="#C0C0C0" valign="middle" align="center"> 
<% 
if(cb.getDays()[i]==null||cb.getDays()[i]=="null")
	out.print(""); 
else 
{
	if(Integer.parseInt(year)==cb.getCurryear()&&(Integer.parseInt(month)+1)==cb.getCurrmonth()&&cb.getDays()[i].equals(String.valueOf(cb.getCurrday())))
		out.print("<font color=red>"+cb.getDays()[i]+"</font>");
	else
	    out.print(cb.getDays()[i]);
}
%>
</td> 
<% } %> 
</tr> 
<% } %> 
</table> 
</FORM> 
<script Language="JavaScript"> 
<!-- 
document.sm.month.options.selectedIndex=<% if(month==null||month.equals("")||month.equals("null")) out.print(cb.getCurrmonth()-1); else out.print(month);%>; 
//--> 
</script> 
</body> 
</html>  
