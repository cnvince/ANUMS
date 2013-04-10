package com;
import com.DBpool;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet 
{

	private Connection conn;
	private PreparedStatement pstate;
	private ResultSet rs;
	
	public LoginServlet() 
	{
		super();
	}
	
	public void init() throws ServletException 
	{
		if(conn==null)
		{	
			try
			{
				conn=DBpool.getConnection();
			}
			catch(NamingException e)
			{
				e.printStackTrace();
			}
			catch(SQLException se)
			{
				se.printStackTrace();
			}
		}		
	}
	
	public void destroy()
	{
		super.destroy(); 
		try
		{
			conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public boolean checkLogin(UserBean ub)
	{
			int jg=0;
			try
			{	
				pstate=conn.prepareStatement("select * from user where loginname=? and password=?");
				pstate.setString(1,ub.getName());
				pstate.setString(2,ub.getPwd());
				rs=pstate.executeQuery();				
				if(rs.next())
					jg=1;
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				try
				{
					rs.close();
					pstate.close();	
				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}
			}
			if(jg>0)
				return true;
			else 
				return false;
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{

		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		UserBean ub=new UserBean(name,pwd);
		
		if(this.checkLogin(ub))
			out.print("<center><h2>登录成功！</h2></center>");
		else
			out.print("<center><h2>登录失败！</h2><br><a href='login.jsp'>重新登录</a></center>");
		
	}

}
