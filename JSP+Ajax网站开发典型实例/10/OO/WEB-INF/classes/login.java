package test;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.*;
public class login extends HttpServlet
{  public void init(ServletConfig config) throws ServletException
    {
      super.init(config);
    }
   public void service(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
       response.setContentType("text/html;charset=GB2312");//设置响应的MIME类型。
       PrintWriter out=response.getWriter();//获得一个向客户发送数据的输出流：
       String name=request.getParameter("username");
       String pws=request.getParameter("password");
      try{
          Conn conn=new Conn(); 
          String sql="select * from oa_user where zhangh='"+name+"' and zhangm='"+pws+"'"; 
          ResultSet rs=conn.executeQuery(sql);
          if(rs.next())
             {
               rs.first();
               String num=rs.getString("cishu");
               int number=Integer.parseInt(num);
               number=number+1;
               SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");  
               String Add_time = formatter.format(new java.util.Date()); 
               String sq="update oa_user set cishu='"+number+"',dtime='"+Add_time+"' where zhangh='"+name+"'";
               conn.Exec(sq);
               HttpSession session=request.getSession(true);
               session.setAttribute("name",name); 
               response.sendRedirect("index.jsp");
             }
           else{
               response.sendRedirect("login.html");
             }
         }
       catch(Exception e){
              out.print(e);
           }
    } 
  public void destroy(){}
}