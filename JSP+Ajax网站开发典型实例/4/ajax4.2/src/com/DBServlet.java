package com;
import com.DBpool;
import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DBServlet extends HttpServlet 
{
	private Connection conn;
	private Statement state;
	private ResultSet rs;
	private int pageT;     //存储总页数
	
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

    public Vector getUsers()
    {
		    Vector v=new Vector();
			try
			{	
				if(conn==null)
					System.out.println("can not connection Database!");
				state=conn.createStatement();
				rs=state.executeQuery("select * from user");
				while(rs.next())
				{
					UserBean no=new UserBean(rs.getString("name"),rs.getInt("age"));
					v.add(no);		
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
    
    public Vector split(int page,int ps)
    {
    	Vector v=new Vector();
    	v=getUsers();
		Vector rtnV=new Vector();
		for(int j=(page-1)*ps;j<(page-1)*ps+ps;j++)
		{
			if(j>=v.size())
				break;
			else
			{
				rtnV.add(v.get(j));
			}
		}	
		if(v.size()%ps==0)
			pageT=v.size()/ps;
		else
			pageT=v.size()/ps+1;	
		return rtnV;
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
	    int pageb;    //存储当前页码
	    if(request.getQueryString()==null)
	    	 pageb=1;
	    else 
	    	 pageb=Integer.parseInt(request.getParameter("page"));
	    	 
	 	Vector v= split(pageb,5);    //调用分页方法
	 	 	
	 	out.println("<html><head><meta http-equiv='Content-Type' content='text/html; charset=GBK'></head><body>");
	 	out.println("<center><h2>Servlet分页显示</h2><table width='60%' border='1'><tr style='background:#999999'><td align='center'>姓名</td><td align='center'>年龄</td></tr>");
	     for(int j=0;j<v.size();j++)
	     {
	     	UserBean ub=new UserBean();
	     	ub=(UserBean)v.get(j);
	     	out.println("<tr><td align='center'>"+ub.getName()+"</td><td align='center'>"+ub.getAge()+"</td></tr>");
	     }
	     String upp="1";
	     String downp=String.valueOf(pageT);
	     
	     if(pageb-1>1) 
	    	 upp=String.valueOf(pageb-1);
	     if(pageb+1<pageT) 
	    	 downp=String.valueOf(pageb+1);
	     
	    out.println("<tr><td colspan='2' align='center'><a href='DBServlet.html?page=1'>首页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='DBServlet.html?page="+upp+"'>上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='DBServlet.html?page="+downp+"'>下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=DBServlet.html?page="+pageT+">尾页</a></td></tr></table></center>");
	 	out.println("</body></html>");

	}

}
