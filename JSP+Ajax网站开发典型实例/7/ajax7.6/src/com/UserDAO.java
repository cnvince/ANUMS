package com;
import java.sql.*;

public class UserDAO
{
	private Connection conn;
	private Statement state;
	private ResultSet rs;
	
	public UserDAO()
	{
		if(conn==null)
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user?useUnicode=true&amp;characterEncoding=UTF-8","root","19841025");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	}
    public String getUsers()
    {
		    StringBuffer sb=new StringBuffer();
		    sb.append("{userList:[");
			try
			{	
				if(conn==null)
					System.out.println("can not connection Database!");
				state=conn.createStatement();
				rs=state.executeQuery("select * from user");
				while(rs.next())
					sb.append("{id:'"+rs.getInt("id")+"',name:'"+rs.getString("name")+"',age:'"+rs.getInt("age")+"'},");
				sb.delete(sb.length()-1, sb.length());
				sb.append("]}");
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
			return sb.toString();
    } 

    public boolean updateUser(String id,String age)
    {
    	boolean jg=false;
    	try
    	{
    		state=conn.createStatement();
    		if(state.executeUpdate("update user set age='"+Integer.parseInt(age)+"' where id="+id)>0)
    			jg=true;
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
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		return jg;
    }
}


