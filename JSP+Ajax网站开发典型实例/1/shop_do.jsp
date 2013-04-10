<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>控制页面</title>
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
         ArrayList list=null;//定义保存商品名称的动态数组。
         list=(ArrayList)session.getAttribute("list");
         if(list==null){//如果用户是第一次购买
           list=new ArrayList();
           list.add(goodsName);
           session.setAttribute("list",list);
         }else{
           list.add(goodsName);
         } 
     %>
      <center>
        <strong>提示：您刚才选择了商品<font color="red"><%=goodsName %>
        </font>,请问您还想做什么？</strong> <br><br>
        <button onclick="location.href='shop.jsp'">继续购买商品</button>
        <button onclick="location.href='pay.jsp'">到收银台结帐</button>
      </center>
     <%  
       }else{
         response.sendRedirect("shop.jsp");
       }
      %>
  </body>
</html>
