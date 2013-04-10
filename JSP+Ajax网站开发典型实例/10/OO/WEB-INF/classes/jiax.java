package test;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.*;
public class jiax extends HttpServlet
{  
   public void service(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
       response.setContentType("text/html;charset=GB2312");//设置响应的MIME类型。
       PrintWriter out=response.getWriter();//获得一个向客户发送数据的输出流：

       String title=request.getParameter("title");
       String sercet=request.getParameter("secret");
       String jinj=request.getParameter("jinj");
       String jiac=request.getParameter("jiac");
       String fzr=request.getParameter("fzr");
       String jias=request.getParameter("jias");
       String jiar=request.getParameter("jiar");
       String jiad=request.getParameter("jiad");
       String starttime=request.getParameter("starttime");
       String endtime=request.getParameter("endtime");
        String fad=request.getParameter("fad");

       title=getS(title);
       sercet=getS(sercet);
       jinj=getS(jinj);
       jiac=getS(jiac);
       fzr=getS(fzr);
       jias=getS(jias);
       jiar=getS(jiar);
       jiad=getS(jiad);
       starttime=getS(starttime);
       endtime=getS(endtime);
       fad=getS(fad);

       SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");  
       String Add_time = formatter.format(new java.util.Date()); 
       HttpSession session=request.getSession(true);
       String name=(String)session.getAttribute("name"); 
      try{
               Conn conn=new Conn(); 

      String sql="insert into oa_jiaban (title,sercet,jinj,jiac,fzr,jias,jiar,jiad,starttime,endtime,fad,ischu,yijian,cjr,cjt) values('"+title+"','"+sercet+"','"+jinj+"','"+jiac+"','"+fzr+"','"+jias+"','"+jiar+"','"+jiad+"','"+starttime+"','"+endtime+"','"+fad+"','0','0','"+name+"','"+Add_time+"')";
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