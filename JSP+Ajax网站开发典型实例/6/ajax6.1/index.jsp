<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	double firstnum,secondnum;
	double jg=0.0;
	String fh="";
	firstnum=Double.parseDouble(request.getParameter("firstnum"));
	secondnum=Double.parseDouble(request.getParameter("secondnum"));
	fh=request.getParameter("fh");
	if(fh.equals("#"))
		jg=firstnum+secondnum;
	if(fh.equals("-"))
		jg=firstnum-secondnum;
	if(fh.equals("*"))
		jg=firstnum*secondnum;
	if(fh.equals("/"))
		jg=firstnum/secondnum;
	out.print(jg);
%>

