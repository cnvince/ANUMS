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
       response.setContentType("text/html;charset=GB2312");//������Ӧ��MIME���͡�
       PrintWriter out=response.getWriter();//���һ����ͻ��������ݵ��������
       String Sid=request.getParameter("id");
       int id=Integer.parseInt(Sid);
      try{
      Conn conn=new Conn(); 
      String sql="update oa_jihua set sp='1' where id="+id;
      conn.Exec(sql);
      out.print("<script Lanuage='JavaScript'>window.alert('�ƻ�����ͨ��')</script>");
      out.print("<script Lanuage='JavaScript'>window.location ='gzjh/shenp.jsp'</script>");
         }
       catch(Exception e){
              out.print(e);
           }
    } 

  public void destroy(){}
}