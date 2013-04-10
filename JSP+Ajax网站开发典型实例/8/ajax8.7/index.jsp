<%@ page language="java" import="java.util.*,com.StuDAO" pageEncoding="UTF-8"%>
<%
String colname=request.getParameter("colname");
String type=request.getParameter("type");
StuDAO sd=new StuDAO();
String value=sd.getInfoBySort(colname,type); //根据参数进行排序查询
out.print(value);  //向客户端输出信息
%>

