<%@ page language="java" import="java.io.*" pageEncoding="gb2312"%>
<html>
  <head>
     <title>JSP��ȡTXT��ʽ�ĵ�</title>
     <style type="text/css">
      <!--
       body {
	        background-image: url(images/img.jpg);
       }
      -->
    </style>
  </head>
  <%
       String path="C:\\Tomcat\\webapps\\JSP_Ajax";//TOMCATվ�㹤��·����
       File file=new File(path,"MyHtml.html");
       FileReader fr=new FileReader(file);//�ַ���������
       BufferedReader br=new BufferedReader(fr); //ʹ�ļ����԰��ж�ȡ�����л��幦�ܡ�
       StringBuffer strB=new StringBuffer();//strB�����洢jsp.txt�ļ�������ݡ�
       String str=br.readLine();//��ȡ�ļ���һ�С�
       while(str!=null){
         strB.append(str).append("<br>");//����ȡ�����ݷ���strB
         str=br.readLine();
       }
       br.close();//�ر���������
   %>
  <body>
     <%=strB %>
  </body>
</html>
