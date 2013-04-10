package test;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.*;
public class renw extends HttpServlet
{  
   public void service(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
       response.setContentType("text/html;charset=GB2312");//设置响应的MIME类型。
       PrintWriter out=response.getWriter();//获得一个向客户发送数据的输出流：
       String zhuti=request.getParameter("zhuti");
       String zhongy=request.getParameter("zhongy");      
       String jinj=request.getParameter("jinj");
       String xiaf=request.getParameter("xiaf");
       String zhix=request.getParameter("zhix");
       String cany=request.getParameter("cany");
       String wanc=request.getParameter("wanc");      
       String content=request.getParameter("content");
       String fj=request.getParameter("fj");
       String guanl=request.getParameter("guanl");
       zhuti=getS(zhuti);
       zhongy=getS(zhongy); 
       jinj=getS(jinj);
       xiaf=getS(xiaf);
       zhix=getS(zhix);
       cany=getS(cany);
       wanc=getS(wanc); 
       content=getS(content);
       fj=getS(fj);
       guanl=getS(guanl);
       SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");  
       String Add_time = formatter.format(new java.util.Date());  
       HttpSession session=request.getSession(true);
       String name=(String)session.getAttribute("name"); 
       String sql="insert into renwu (zhuti,zhongy,jinj,jind,xiaf,zhix,cany,xiat,want,content,fj,guanl,wangc,heg,rwcj) values('"+zhuti+"','"+zhongy+"','"+jinj+"','0','"+xiaf+"','"+zhix+"','"+cany+"','"+Add_time+"','"+wanc+"','"+content+"','null','"+guanl+"','0','0','"+name+"')";
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