package com;

import com.DBpool;
import com.UserBean;
import java.util.Vector;
import java.sql.*;
import javax.naming.*;

public class UserDAO
{
	private Connection conn;
	private Statement state;
	private PreparedStatement pstate;
	private ResultSet rs;
	public int pageT;      //存储总页数

	public UserDAO()
	{
		if(conn==null)
		{
			try
			{
				conn=DBpool.getConnection();	//获得数据库连接对象				
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
    public Vector getUsers()   //查询数据库获得信息
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
    public Vector split(int page,int ps)     //实现分页功能
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
  
}


