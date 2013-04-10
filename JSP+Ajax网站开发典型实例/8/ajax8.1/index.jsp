<%@ page language="java" import="java.util.*,com.PostDAO" pageEncoding="utf-8"%>
<%
String postcode=request.getParameter("obj");  //接受参数值
PostDAO pd=new PostDAO();
String value=pd.getCityByPost(postcode);
out.print(value);  //向客户端输出信息
%>
