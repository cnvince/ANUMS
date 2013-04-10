<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
  String PostContent,type;
  String filename;
  File f; 
  FileWriter fw;
  PostContent=request.getParameter("content");
  filename="草稿.txt";//保存草稿的文件
  filename= request.getRealPath("/"+filename);
  f = new File(filename);
  if(!f.exists())//如果文件不存，则建立
  	f.createNewFile();
  fw = new FileWriter(filename); //建立FileWrite对象,并设定由fw对象变量引用
  fw.write(PostContent);
  fw.close(); //关闭文件
  out.println("最后于 "+new Date().toString()+" 自动保存成功!");
%>
