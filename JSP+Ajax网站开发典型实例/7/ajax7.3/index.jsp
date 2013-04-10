<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.ProductDAO;"%>
<%
ProductDAO pd=new ProductDAO();
out.print(pd.getProduct());
%>


