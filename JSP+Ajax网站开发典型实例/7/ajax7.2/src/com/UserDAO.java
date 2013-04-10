package com;
import java.sql.*;

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
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/testajax?useUnicode=true&amp;characterEncoding=UTF-8","root","19841025");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	}
	
	public String getUser()
	{
		StringBuffer UserInfo=new StringBuffer();
		UserInfo.append("{UserInfo:[");
		try
		{
			state=conn.createStatement();
			rs=state.executeQuery("select realname,age from user");
			while(rs.next())
			{
				UserInfo.append("{name:'"+rs.getString("realname")+"',age:'"+rs.getInt("age")+"'},");
			}
			UserInfo.delete(UserInfo.length()-1, UserInfo.length());
			UserInfo.append("]}");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				state.close();
				rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return UserInfo.toString();
	}
	
    public boolean addUser(String name,String age)
    {
    		int jg=0;
			try
			{	
				pstate=conn.prepareStatement("insert into user (realname,age) values (?,?)");
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
				pstate=conn.prepareStatement("update user set realname=?,age=? where realname=?");
				pstate.setString(1,name);
				pstate.setString(2,age);
				pstate.setString(3,name);
				jg=pstate.executeUpdate();							
			}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally
			{
				try{
					pstate.close();	
				}
				catch(SQLException e){
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
				pstate=conn.prepareStatement("delete from user where realname=?");
				pstate.setString(1, name);
				jg=pstate.executeUpdate();
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				try{
					pstate.close();	
				}
				catch(SQLException e){
					e.printStackTrace();
				}	
			}
			if(jg>0)
				return true;   	
			return false;
    }
}


