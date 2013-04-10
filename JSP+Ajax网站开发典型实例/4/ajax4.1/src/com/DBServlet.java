package com;
import com.DBpool;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DBServlet extends HttpServlet 
{
	private Connection conn;
	private Statement state;
	private PreparedStatement pstate;
	
	public DBServlet() 
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
	
    public boolean addUser(String name,String age)
    {
    		int jg=0;
			try
			{	
				pstate=conn.prepareStatement("insert into user (name,age) values (?,?)");
				pstate.setString(1,name);
				pstate.setString(2,age);
				jg=pstate.executeUpdate();
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				try
				{
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
    public boolean updateUser(String name,String age)
    {
			int jg=0;
			try
			{	
				pstate=conn.prepareStatement("update user set name=?,age=? where name=?");
				pstate.setString(1,name);
				pstate.setString(2,age);
				pstate.setString(3,name);
				jg=pstate.executeUpdate();							
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				try
				{
					pstate.close();	
				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}
			}
			if(jg>0)
				return true;   	
			return false;   	
    }
    public boolean delUser(String name)
    {	
			int jg=0;	
			try
			{	
				state=conn.createStatement();
				jg=state.executeUpdate("delete from user where name = '"+name+"'");						
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				try
				{
					state.close();	
				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}	
			}
			if(jg>0)
				return true;   	
			return false;
    }
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{

		request.setCharacterEncoding("utf-8"); 
		String type=request.getParameter("type");
		String name=request.getParameter("name");
		String age=request.getParameter("age");
		PrintWriter out=response.getWriter();
	
		if(type.equals("add"))
		{
			if(this.addUser(name, age))
				response.sendRedirect("index.html");
		}
		if(type.equals("update"))
		{
			if(this.updateUser(name, age))
				response.sendRedirect("index.html");		
		}
		if(type.equals("del"))
		{
			if(this.delUser(name))
				response.sendRedirect("index.html");
		}
			
		out.println("</body></html>");
	}
	
}
