package test;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.*;
public class jh extends HttpServlet
{  
   public void service(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
       response.setContentType("text/html;charset=GB2312");//设置响应的MIME类型。
       PrintWriter out=response.getWriter();//获得一个向客户发送数据的输出流：
       String mc=request.getParameter("mc");
       String leib=request.getParameter("leib");
       String fanw=request.getParameter("fanw");
       String jb=request.getParameter("jb");
       String zhuangt=request.getParameter("zhuangt");
       String sl=request.getParameter("sl");
       String dtime=request.getParameter("dtime");
       String content=request.getParameter("content");
       String zhix=request.getParameter("zhix");
       String fj=request.getParameter("fj");
        String bum=request.getParameter("bum");
       if(fj.equals(""))
             fj="";
       String gl=request.getParameter("gl");
       mc=getS(mc);
       leib=getS(leib);
       fanw=getS(fanw);
       jb=getS(jb);
       zhuangt=getS(zhuangt);
       sl=getS(sl);
       dtime=getS(dtime);
       content=getS(content);
       zhix=getS(zhix);
       fj=getS(fj);
       gl=getS(gl);

       bum=new String(bum.getBytes("iso-8859-1"),"utf-8");
        System.out.print("dd"+bum);

       HttpSession session=request.getSession(true);
       String name=(String)session.getAttribute("name"); 
      try{
               Conn conn=new Conn(); 
      String sql="insert into oa_jihua (mc,fw,leib,jibie,zhuangt,shij,shit,content,zhi,fj,gl,jhr,bum,sp) values('"+mc+"','"+fanw+"','"+leib+"','"+jb+"','"+zhuangt+"','"+sl+"','"+dtime+"','"+content+"','"+zhix+"','"+fj+"','"+gl+"','"+name+"','"+bum+"','0')";
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