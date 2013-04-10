package com;

import com.*;
import java.util.Vector;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.sql.Date;

public class UserDAO
{
	private Connection conn;
	private Statement state;
	private PreparedStatement pstate;
	private ResultSet rs;

	public UserDAO()
	{
		if(conn==null)
		{	
			try
			{
				conn=DBpool.getConnection();        //获得数据库连接对象
					
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
    public boolean addUser(String name,String age)     //向数据库中添加数据
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
    public boolean updateUser(String name,String age,int id)     //更新数据库中的数据
    {
			int jg=0;
			try
			{	
				pstate=conn.prepareStatement("update user set name=?,age=? where id=?");
				pstate.setString(1,name);
				pstate.setString(2,age);
				pstate.setInt(3,id);
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
    public boolean delUser(String id)     //删除数据库中的数据
    {	
			int jg=0;	
			try
			{	
				state=conn.createStatement();
				jg=state.executeUpdate("delete from user where id in ("+id+")");						
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
}


