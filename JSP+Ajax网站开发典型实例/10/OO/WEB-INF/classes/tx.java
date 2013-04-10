package test;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.*;
public class tx extends HttpServlet
{  
   public void service(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
       response.setContentType("text/html;charset=GB2312");//设置响应的MIME类型。
       PrintWriter out=response.getWriter();//获得一个向客户发送数据的输出流：

       String title=request.getParameter("title");
       String secret=request.getParameter("secret");
       String jinj=request.getParameter("jinj");
       String type=request.getParameter("type");
       String qjr=request.getParameter("qjr");
       String bum=request.getParameter("bum");
       String starttime=request.getParameter("starttime");
       String endtime=request.getParameter("endtime");
       String reason=request.getParameter("reason");
       title=getS(title);
       secret=getS(secret);
       jinj=getS(jinj);
       type=getS(type);
       qjr=getS(qjr);
       bum=getS(bum);
       reason=getS(reason);
       HttpSession session=request.getSession(true);
       String name=(String)session.getAttribute("name");
      SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");  
     String Add_time = formatter.format(new java.util.Date());  
      try{
               Conn conn=new Conn(); 

      String sql="insert into oa_qingjia (title,secret,jinj,type,qjr,bum,starttime,endtime,reason,sessn,ischu,isdang,qjt) values('"+title+"','"+secret+"','"+jinj+"','"+type+"','"+qjr+"','"+bum+"','"+starttime+"','"+endtime+"','"+reason+"','"+name+"','0','0','"+Add_time+"')";
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