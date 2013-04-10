<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
  <%@ page language="java" import="java.util.*" %>
  <%! String days[]; %>
  <body>
  <%
  days=new String[42];
  for(int i=0;i<42;i++)
  {
  days[i]="";
  }
  %>
  <%
  GregorianCalendar currentDay = new GregorianCalendar();
  int today=currentDay.get(Calendar.DAY_OF_MONTH);
  int month=currentDay.get(Calendar.MONTH);
  int year= currentDay.get(Calendar.YEAR);
  out.println(year+"年"+ (month+1)+"月"+today+"日");
  Calendar thisMonth=Calendar.getInstance();
  thisMonth.set(Calendar.MONTH, month );
  thisMonth.set(Calendar.YEAR, year );
  thisMonth.setFirstDayOfWeek(Calendar.SUNDAY);
  thisMonth.set(Calendar.DAY_OF_MONTH,1);
  int firstIndex=thisMonth.get(Calendar.DAY_OF_WEEK)-1;
  int maxIndex=thisMonth.getActualMaximum(Calendar.DAY_OF_MONTH);
  for(int i=0;i<maxIndex;i++)
  {
  days[firstIndex+i]=String.valueOf(i+1);
  }
  %>

  <table border="0" width="168" height="81">
  <div align=center>
  <tr>
  <th width="25" height="16" ><font color="red">日</font>
  </th>
  <th width="25" height="16" >一</th>
  <th width="25" height="16" >二</th>
  <th width="25" height="16" >三</th>
  <th width="25" height="16" >四</th>
  <th width="25" height="16" >五</th>
  <th width="25" height="16" ><font color="red">六</font></th>
  </tr>
  <% for(int j=0;j<6;j++) { %>
  <tr>
  <% for(int i=j*7;i<(j+1)*7;i++) { %>
  <td width="15%" height="16"  valign="middle" align="center">
  <%if((i-firstIndex+1)==today){
  %>
  <font color="red"><%=days[i]%></font>
  <%
  } else {
  %>
  <%=days[i]%>
  <%
  }
  %>
  </td>
  <% }  %>
  </tr>
  <% }  %>
  </div>
  </table>
