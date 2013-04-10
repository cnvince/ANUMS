package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NumberGuessServlet extends HttpServlet 
{

	NumberGuessBean ngb;
	
	public NumberGuessServlet() 
	{
		super();
	}
	
	public void init() throws ServletException 
	{
		ngb=new NumberGuessBean();
	}

	public void destroy() 
	{
		super.destroy(); 
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String guess=request.getParameter("guess");
		String status=request.getParameter("status");
		if(status==null)
			status="";
		if(status.equals("reset"))
			ngb=new NumberGuessBean();
		
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		
		out.print("<center><h2>Servlet调用JavaBean实现猜数字游戏</h2><br>");
		out.print("系统已经产生了一个1-100之间的数字，可以开始猜数字了！<br>");
		out.print("<form method='post' action='NumberGuessServlet.html'>请输入你猜的数字：<input type='text' name='guess'><input type='submit' value='提交'>&nbsp;&nbsp;<a href='NumberGuessServlet.html?status=reset'>重新开始</a></form>");
		if(guess!=null&&!guess.equals("null"))
			out.print("<font color='red'>"+ngb.setGuess(guess)+"</font></center>");
     }
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doPost(request,response);
	}
}
