<%@ page language="java" pageEncoding="gb2312"%>
<html>
  <head>
    <title>ʹ��Application��������վ������</title>
    <style type="text/css">
      <!--
       body {
	        background-image: url(images/img.jpg);
       }
      -->
    </style>
  </head>
  <%
     Object oCount=application.getAttribute("count");
     Integer count=null;
     if(oCount==null){
       count=new Integer(1);
       application.setAttribute("count",count);
     }else{
       count=(Integer)application.getAttribute("count");
       count=new Integer(count.intValue()+1);
       application.setAttribute("count",count);
     }
   %>
  <body>
    <br>
    <h3>���ڷÿ����ã���ӭ���ĵ�����</h3>
    ��������ĵ�<font color="red"><%=count.intValue() %></font>λ�ÿͣ�ף����Ŀ��֣�
  </body>
</html>
