<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>����ҳ��</title>
    <style type="text/css">
      <!--
       body {
	        background-image: url(images/img.jpg);
       }
      -->
    </style>
  </head>
  <body><br>
     <% 
       String goodsName=request.getParameter("goods"); 
       if(!goodsName.equals("")){ 
         goodsName=new String(goodsName.getBytes("ISO-8859-1")); 
         ArrayList list=null;//���屣����Ʒ���ƵĶ�̬���顣
         list=(ArrayList)session.getAttribute("list");
         if(list==null){//����û��ǵ�һ�ι���
           list=new ArrayList();
           list.add(goodsName);
           session.setAttribute("list",list);
         }else{
           list.add(goodsName);
         } 
     %>
      <center>
        <strong>��ʾ�����ղ�ѡ������Ʒ<font color="red"><%=goodsName %>
        </font>,������������ʲô��</strong> <br><br>
        <button onclick="location.href='shop.jsp'">����������Ʒ</button>
        <button onclick="location.href='pay.jsp'">������̨����</button>
      </center>
     <%  
       }else{
         response.sendRedirect("shop.jsp");
       }
      %>
  </body>
</html>
