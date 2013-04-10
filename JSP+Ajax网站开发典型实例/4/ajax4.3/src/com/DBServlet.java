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

    public Vector getShopping()
    {
		    Vector v=new Vector();			
			try
			{	
				state=conn.createStatement();
				rs=state.executeQuery("select * from shopping");
				while(rs.next())
				{	
					ShoppingBean sb=new ShoppingBean(rs.getInt(1),rs.getString(2),rs.getDouble(3));
					v.add(sb);
		
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
    
    public ShoppingBean getShoppingById(String id)
    {	   
    	    ShoppingBean sb=new ShoppingBean();		
			try
			{	
				state=conn.createStatement();
				rs=state.executeQuery("select * from shopping where id="+id);
				if(rs.next())
				{
					sb.setId(rs.getInt("id"));
					sb.setName(rs.getString("name"));
					sb.setNum(rs.getDouble("num"));
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
			return sb;   
    }
    
    public boolean addShopping(String name,String num)
    {
    		int jg=0;   		
			try
			{	
				pstate=conn.prepareStatement("insert into shopping (name,num) values (?,?)");
				pstate.setString(1,name);
				pstate.setDouble(2,Double.parseDouble(num));

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
    public boolean updateShopping(String id,String num)
    {
			int jg=0;			
			try
			{	
				pstate=conn.prepareStatement("update shopping set num=? where id=?");
				pstate.setDouble(1,Double.parseDouble(num));
				pstate.setInt(2,Integer.parseInt(id));

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
    public boolean delShopping(String id)
    {   		
			int jg=0;			
			try
			{	
				state=conn.createStatement();
				jg=state.executeUpdate("delete from shopping where id in ("+id+")");				
			
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
		PrintWriter out=response.getWriter();
		HttpSession hs=request.getSession();
		
		if(type==null||type.equals("null"))
		{
			hs.setAttribute("shoppingList", this.getShopping());
			response.sendRedirect("index.jsp");
		}
		else
		{
			if(type.equals("one"))
			{
				String id=request.getParameter("id");
				hs.setAttribute("shoppingOne", this.getShoppingById(id));
				response.sendRedirect("editProduct.jsp");
			}
			if(type.equals("add"))
			{
				String name=request.getParameter("name");
				String num=request.getParameter("num");
				if(this.addShopping(name,num))
				{
					hs.setAttribute("shoppingList", this.getShopping());
					response.sendRedirect("index.jsp");
				}
			}
			if(type.equals("update"))
			{
				String id=request.getParameter("id");
				String num=request.getParameter("num");
				if(this.updateShopping(id, num))
				{
					hs.setAttribute("shoppingList", this.getShopping());
					response.sendRedirect("index.jsp");				
				}
			}
			if(type.equals("del"))
			{
				String id=request.getParameter("id");
				if(this.delShopping(id))
				{
					hs.setAttribute("shoppingList", this.getShopping());
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
