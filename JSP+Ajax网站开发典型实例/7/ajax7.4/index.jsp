<%@ page language="java" import="com.StuDAO" pageEncoding="UTF-8"%>
<%
String chengjiOP=request.getParameter("chengjiOP");
String chengji=request.getParameter("chengji");
String where=" chengji "+chengjiOP+chengji;
String colname=request.getParameter("colname");
String type=request.getParameter("type");

StuDAO sd=new StuDAO();
String value=sd.getInfoBySort(where,colname,type); //根据参数进行排序查询
out.print(value);  //向客户端输出信息
%>

