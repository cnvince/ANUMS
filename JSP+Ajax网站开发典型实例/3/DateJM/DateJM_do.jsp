<%@ page language="java" import="com.DateJM" pageEncoding="utf-8"%>
<html>
 
  <body>
  <% 
  	request.setCharacterEncoding("utf-8");
    String date=new String();
    date=request.getParameter("date");           //获得提交过来的要被加密的数据
    DateJM djm=new DateJM();                     //开始使用DateJM类
    byte newdate[]=djm.encode(date.getBytes());
    out.println("加密后："+newdate.toString());
    out.println("解密后："+new String(djm.decode(djm.encode(date.getBytes()))));
   %> 
    
  </body>
</html>
