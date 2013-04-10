package test;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.*;


public class shenp1 extends HttpServlet
{  
   public void service(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
       response.setContentType("text/html;charset=GB2312");//设置响应的MIME类型。
       PrintWriter out=response.getWriter();//获得一个向客户发送数据的输出流：
       String Sid=request.getParameter("id");
       int id=Integer.parseInt(Sid);
      try{
      Conn conn=new Conn(); 
      String sql="update oa_jihua set sp='1' where id="+id;
      conn.Exec(sql);
      out.print("<script Lanuage='JavaScript'>window.alert('计划审批通过')</script>");
      out.print("<script Lanuage='JavaScript'>window.location ='gzjh/shenp.jsp'</script>");
         }
       catch(Exception e){
              out.print(e);
           }
    } 

  public void destroy(){}
}