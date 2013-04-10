<%@ page language="java" pageEncoding="gb2312"%>
<html>
  <head>
    <title>课程表</title>
    <style type="text/css">
      <!--
       body {
	        background-image: url(images/img.jpg);
       }
      -->
    </style>
  </head>
  <%
    String head[]={"星期一","星期二","星期三","星期四","星期五","星期六","星期日"};//课程表最上一行。
    String left[]={"上午","下午","晚上"};//课程表的左边一行。
    String main[][]={
    {"语文","数学","数学","语文","英语","休息","休息"},
    {"数学","英语","语文","英语","数学","休息","休息"},
    {"自习","自习","自习","自习","自习","休息","休息"}
    };//课程安排。
   %>
  <body><br>
    <center><b>希望小学课程表</b></center>
    <table width="500" height="100" border="1" align="center">
    <%
       for(int i=0;i<4;i++)//课程表有四行。
       {
         out.print("<tr>");
         for(int j=0;j<8;j++)//课程表有八列。
         {
           if(i==0&&j==0)
             out.print("<td>星期/时间</td>");
           if(i==0&&j!=0)
             out.print("<td>"+head[j-1]+"</td>");
           if(i!=0&&j==0)
             out.print("<td>"+left[i-1]+"</td>");
           if(i!=0&&j!=0)
             out.print("<td>"+main[i-1][j-1]+"</td>");
         }
         out.print("</tr>");
       }
     %>
     </table>
  </body>
</html>
