package test;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.*;
public class rizhi extends HttpServlet
{  
   public void service(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
       response.setContentType("text/html;charset=GB2312");//设置响应的MIME类型。
       PrintWriter out=response.getWriter();//获得一个向客户发送数据的输出流：
       String title=request.getParameter("title");
       String type=request.getParameter("type");
       String secret=request.getParameter("secret");
       String startdate=request.getParameter("startdate");
       String content=request.getParameter("content");
       title=getS(title);
       type=getS(type);
       secret=getS(secret);
       content=getS(content);
       SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd H:m:s");  
       String Add_time = formatter.format(new java.util.Date()); 
       HttpSession session=request.getSession(true);
       String name=(String)session.getAttribute("name"); 
       String sql="insert into oa_rizhi(title,type,secret,rizit,content,cjr,cjt) values('"+title+"','"+type+"','"+secret+"','"+startdate+"','"+content+"','"+name+"','"+Add_time+"')";
      try{
               Conn conn=new Conn(); 
               conn.Exec(sql);
               out.print("1");
         }
       catch(Exception e){
              out.print(e);
           }
    } 
  public void destroy(){}
  public String getS(String str){
        try{
           byte b[]=str.getBytes("iso-8859-1");
           str=new String(b,"utf-8");
           return str;}
        catch(Exception e){
           return "error";
         }
  }
}