<%@ page language="java" import="java.util.*" %> 
<%! String year; 
  String month; 
%> 
<% month=request.getParameter("month"); 
  year =request.getParameter("year"); 
%> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
<title>日</title> 
<script Language="JavaScript"> 
<!-- 
function changeMonth() 
{ 
var mm="month.jsp?month="+document.sm.elements[0].selectedIndex+"&year=" 
+<%=year%>; 
window.open(mm,"_self"); 
} 
//--></script> 
</head> 
<%! String days[]; %> 
<% 
days=new String[42]; 
for(int i=0;i<42;i++) 
 { 
  days[i]=""; 
 } 
%> 
<% 
Calendar thisMonth=Calendar.getInstance(); 
 if(month!=null&&(!month.equals("null"))) 
  thisMonth.set(Calendar.MONTH, Integer.parseInt(month) ); 
 if(year!=null&&(!year.equals("null"))) 
  thisMonth.set(Calendar.YEAR, Integer.parseInt(year) ); 
 year=String.valueOf(thisMonth.get(Calendar.YEAR)); 
month=String.valueOf(thisMonth.get(Calendar.MONTH)); 
thisMonth.setFirstDayOfWeek(Calendar.SUNDAY); 
thisMonth.set(Calendar.DAY_OF_MONTH,1); 
int firstIndex=thisMonth.get(Calendar.DAY_OF_WEEK)-1; 
int maxIndex=thisMonth.getActualMaximum(Calendar.DAY_OF_MONTH); 
for(int i=0;i<maxIndex;i++) 
 { 
  days[firstIndex+i]=String.valueOf(i+1); 
 } 
%> 
<body> 
<FORM name="sm" method="post" action="month.jsp"> 
  <p style="background:6C8ACC;font-size:15;"><%=year%>年  <%=Integer.parseInt(month)+1%>月日程安排查看
</p>
<table border="0" width="89%" height="81"> 
<div align=center> 
 <tr> 
   <th width="25" height="16" bgcolor="C2D6EC"><font color="red">日</font> 
</th> 
   <th width="25" height="16" bgcolor="C2D6EC">一</th> 
   <th width="25" height="16" bgcolor="C2D6EC">二</th> 
   <th width="25" height="16" bgcolor="C2D6EC">三</th> 
   <th width="25" height="16" bgcolor="C2D6EC">四</th> 
   <th width="25" height="16" bgcolor="C2D6EC">五</th> 
   <th width="25" height="16" bgcolor="C2D6EC"><font color="green">六</fon 
t></th> 
 </tr> 
<% for(int j=0;j<6;j++) { %> 
<tr> 
     <% for(int i=j*7;i<(j+1)*7;i++) { %> 
    <td width="15%" height="16" bgcolor="E4EAF4" valign="middle" align="ce 
nter"> 
    <a href="day0.jsp?year=<%=year%>&month=<%=Integer.parseInt(month)+1%>&date=<%=days[i]%>"><%=days[i]%></a></td> 
   <% }  %> 
 </tr> 
<% }  %> 
</div> 
</table> 
<table border="0" width="168" height="20"> 
<tr> 
 <td width=30%><select name="month" size="1" onchange="changeMonth()" > 
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
<td width=28% bgcolor='E4EAF4'><input type=text name="year" value=<%=year%> size=4 maxlength 
=4></td> 
<td>年</td> 
<td width=28% bgcolor='E4EAF4'><input type=submit value="提交"></td> 
</tr> 
</table> 
</FORM> 
<script Language="JavaScript"> 
<!-- 
 document.sm.month.options.selectedIndex=<%=month%>; 
//--> 
</script> 
</body> 
</html>   