package test;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.*;
public class tian extends HttpServlet
{  
   public void service(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
       response.setContentType("text/html;charset=GB2312");//������Ӧ��MIME���͡�
       PrintWriter out=response.getWriter();//���һ����ͻ��������ݵ��������

       String title=request.getParameter("title");
       String secret=request.getParameter("secret");
       String jinj=request.getParameter("jinj");
       String ccr=request.getParameter("ccr");
       String md=request.getParameter("md");
       String starttime=request.getParameter("starttime");
       String endtime=request.getParameter("endtime");
       String reason=request.getParameter("reason");
       title=getS(title);
       secret=getS(secret);
       jinj=getS(jinj);
       ccr=getS(ccr);
       md=getS(md);
       reason=getS(reason);
       HttpSession session=request.getSession(true);
       String name=(String)session.getAttribute("name");
      SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");  
     String Add_time = formatter.format(new java.util.Date());  

      try{
               Conn conn=new Conn(); 

      String sql="insert into oa_chucai (title,secret,jinj,ccr,mud,cft,yft,ccs,ischu,yijian,ctr,ctt) values('"+title+"','"+secret+"','"+jinj+"','"+ccr+"','"+md+"','"+starttime+"','"+endtime+"','"+reason+"','0','0','"+name+"','"+Add_time+"')";
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