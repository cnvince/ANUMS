package test;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.*;
public class jindt extends HttpServlet
{  
   public void service(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
       response.setContentType("text/html;charset=GB2312");//������Ӧ��MIME���͡�
       PrintWriter out=response.getWriter();//���һ����ͻ��������ݵ��������

       String jindu=request.getParameter("jindu");
       String jians=request.getParameter("jians");      
       String fj=request.getParameter("fj");
       if(fj.equals(""))
          fj="��";
       String rwid=request.getParameter("rwid");
       jians=getS(jians);
        SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");  
       String Add_time = formatter.format(new java.util.Date()); 
       HttpSession session=request.getSession(true);
       String name=(String)session.getAttribute("name"); 
       String sql="";
       sql="insert into renwu_jind (jindu,jians,jiant,fj,jinr,renwu_id) values('"+jindu+"','"+jians+"','"+Add_time+"','"+fj+"','"+name+"','"+rwid+"')";
         int num=Integer.parseInt(rwid);

      try{
               Conn conn=new Conn(); 
              if(jindu.equals("100"))
                {
                       String sq="update renwu set wangc='1' ,jind='100' where id="+num;
                       conn.Exec(sql);
                       conn.Exec(sq); 
                 }
               else{
                 String sqq="update renwu set jind='"+jindu+"' where id="+num;
                 conn.Exec(sqq);
                 conn.Exec(sql);
                }

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