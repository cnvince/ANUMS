<%@ page language="java" pageEncoding="gb2312"%>
<html>
  <head>
    <title>�γ̱�</title>
    <style type="text/css">
      <!--
       body {
	        background-image: url(images/img.jpg);
       }
      -->
    </style>
  </head>
  <%
    String head[]={"����һ","���ڶ�","������","������","������","������","������"};//�γ̱�����һ�С�
    String left[]={"����","����","����"};//�γ̱�����һ�С�
    String main[][]={
    {"����","��ѧ","��ѧ","����","Ӣ��","��Ϣ","��Ϣ"},
    {"��ѧ","Ӣ��","����","Ӣ��","��ѧ","��Ϣ","��Ϣ"},
    {"��ϰ","��ϰ","��ϰ","��ϰ","��ϰ","��Ϣ","��Ϣ"}
    };//�γ̰��š�
   %>
  <body><br>
    <center><b>ϣ��Сѧ�γ̱�</b></center>
    <table width="500" height="100" border="1" align="center">
    <%
       for(int i=0;i<4;i++)//�γ̱������С�
       {
         out.print("<tr>");
         for(int j=0;j<8;j++)//�γ̱��а��С�
         {
           if(i==0&&j==0)
             out.print("<td>����/ʱ��</td>");
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
