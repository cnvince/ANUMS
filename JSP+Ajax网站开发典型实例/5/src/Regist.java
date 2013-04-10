import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.RequestSQL;

public class Regist extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Regist() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		  response.setCharacterEncoding("gb2312");
          String name=request.getParameter("name");
          String pass=request.getParameter("pass1");
          String email=request.getParameter("email");
          String sql="insert into users values('"+name+"','"+pass+"','"+email+"')";
          RequestSQL rs=new RequestSQL();
          PrintWriter out = response.getWriter();
          try{
        	  rs.insertUser(sql);
        	  out.print("<center><b>×¢²á³É¹¦</b><center>");
          }catch(Exception e){
        	  out.print(e.toString());
          }
          
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}
}
