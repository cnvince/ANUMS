package com;
import com.DBpool;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DBServlet extends HttpServlet 
{
	private Connection conn;
	private Statement state;
	private PreparedStatement pstate;
	private ResultSet rs;
	
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

    public Vector getTong()           
    {
		    Vector v=new Vector();
			
			try
			{	
				state=conn.createStatement();
				rs=state.executeQuery("select * from tongxunlu");
				while(rs.next())
				{	
					TongBean tb=new TongBean(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
					v.add(tb);	
				}
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
					state.close();	
				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}
			}
			return v;   
    }
    
    public TongBean getTongById(String id)
    {	   
    	    TongBean tb=new TongBean();			
			try
			{	
				state=conn.createStatement();
				rs=state.executeQuery("select * from tongxunlu where id="+id);
				if(rs.next())
				{
					tb=new TongBean(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
				}
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
					state.close();	
				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}
			}
			return tb;   
    }
    
    public boolean addTong(TongBean tb)
    {
    		int jg=0;   		
			try
			{	
				pstate=conn.prepareStatement("insert into tongxunlu (name,age,sex,address,phone,QQ,email) values (?,?,?,?,?,?,?)");
				pstate.setString(1,tb.getName());
				pstate.setString(2,tb.getAge());
				pstate.setString(3,tb.getSex());
				pstate.setString(4,tb.getAddress());
				pstate.setString(5,tb.getPhone());
				pstate.setString(6,tb.getQq());
				pstate.setString(7,tb.getEmail());

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
    public boolean updateTong(TongBean tb)
    {
			int jg=0;			
			try
			{	
				pstate=conn.prepareStatement("update tongxunlu set name=?,age=?,sex=?,address=?,phone=?,QQ=?,email=? where id=?");
				pstate.setString(1,tb.getName());
				pstate.setString(2,tb.getAge());
				pstate.setString(3,tb.getSex());
				pstate.setString(4,tb.getAddress());
				pstate.setString(5,tb.getPhone());
				pstate.setString(6,tb.getQq());
				pstate.setString(7,tb.getEmail());
				pstate.setInt(8,tb.getId());

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
    public boolean delTong(String id)
    {   		
			int jg=0;			
			try
			{	
				state=conn.createStatement();
				jg=state.executeUpdate("delete from tongxunlu where id in ("+id+")");				
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
		response.setContentType("text/html; charset=utf-8");
		
		String type=request.getParameter("type");
		HttpSession hs=request.getSession();
		
		if(type==null||type.equals("null"))
		{
			hs.setAttribute("tongList", this.getTong());
			response.sendRedirect("index.jsp");
		}
		else
		{
			if(type.equals("one"))
			{
				String id=request.getParameter("id");
				hs.setAttribute("tongOne", this.getTongById(id));
				response.sendRedirect("editTong.jsp");
			}
			if(type.equals("add"))
			{
				String name=request.getParameter("name");
				String age=request.getParameter("age");
				String sex=request.getParameter("sex");
				String address=request.getParameter("address");
				String phone=request.getParameter("phone");
				String qq=request.getParameter("qq");
				String email=request.getParameter("email");
				
				TongBean tb=new TongBean(0,name,age,sex,address,phone,qq,email);

				if(this.addTong(tb))
				{
					hs.setAttribute("tongList", this.getTong());
					response.sendRedirect("index.jsp");
				}
			}
			if(type.equals("update"))
			{
				String id=request.getParameter("id");
				String name=request.getParameter("name");
				String age=request.getParameter("age");
				String sex=request.getParameter("sex");
				String address=request.getParameter("address");
				String phone=request.getParameter("phone");
				String qq=request.getParameter("qq");
				String email=request.getParameter("email");

				TongBean tb=new TongBean(Integer.parseInt(id),name,age,sex,address,phone,qq,email);
				
				if(this.updateTong(tb))
				{
					hs.setAttribute("tongList", this.getTong());
					response.sendRedirect("index.jsp");				
				}
			}
			if(type.equals("del"))
			{
				String id=request.getParameter("id");
				if(this.delTong(id))
				{
					hs.setAttribute("tongList", this.getTong());
					response.sendRedirect("index.jsp");				
				}
			}
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	{
		doPost(request,response);
	}
}
