package test;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.*;
public class xiug extends HttpServlet
{  
   public void service(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
       response.setContentType("text/html;charset=GB2312");//设置响应的MIME类型。
       PrintWriter out=response.getWriter();//获得一个向客户发送数据的输出流：
       String id=request.getParameter("id");
       int num=Integer.parseInt(id);
       String zhuti=request.getParameter("zhuti");
       String starttime=request.getParameter("starttime");
       String starthour=request.getParameter("starthour");
       String startminute=request.getParameter("startminute");
       String endtime=request.getParameter("endtime");
       String endhour=request.getParameter("endhour");
       String endminute=request.getParameter("endminute");
       String type=request.getParameter("type");
       String secret=request.getParameter("secret");
       String priority=request.getParameter("priority");
       String finish=request.getParameter("finish");
       String awake=request.getParameter("awake");
       String content=request.getParameter("content");
       zhuti=getS(zhuti);
       type=getS(type);
       secret=getS(secret);
       priority=getS(priority);
       finish=getS(finish);
       awake=getS(awake);
       content=getS(content);
       starttime=starttime+" "+starthour+":"+startminute+":00";
       endtime=endtime+" "+endhour+":"+endminute+":00";
       SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");  
       String Add_time = formatter.format(new java.util.Date()); 
       HttpSession session=request.getSession(true);
       String name=(String)session.getAttribute("name"); 
       String sql="update oa_richeng set zhuti='"+zhuti+"',starttime='"+starttime+"',endtime='"+endtime+"',arrtype='"+type+"',secret='"+secret+"',priority='"+priority+"',finish='"+finish+"',awake='"+awake+"',content='"+content+"',cjr='"+name+"',cjt='"+Add_time+"' where id="+num;
         System.out.print(sql);
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