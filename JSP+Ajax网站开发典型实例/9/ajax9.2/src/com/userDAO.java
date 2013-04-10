package com;
import java.util.Vector;
import java.sql.*;

import javax.naming.*;

public class userDAO 
{
	private static Connection conn;
	private Statement state;
	private ResultSet rs;

	public userDAO()
	{
		if(conn==null)
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver").newInstance();	//装置数据库连接驱动			
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspajax?useUnicode=true&amp;characterEncoding=utf-8","root","19841025");
			}
			catch(Exception e){
				e.printStackTrace();
			}		
		}
	}
    public String checkLogin(String name,String pwd)  //查询数据库
    {		
    		String v="";
			try{	
				state=conn.createStatement();			
				rs=state.executeQuery("select * from user where logname='"+name+"'");				
				if(rs.next())
				{
					rs=state.executeQuery("select * from user where logname='"+name+"' and password='"+pwd+"'");
					if(rs.next())
						v="1";
					else
						v="2";
				}
				else
					v="0";
			}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				try{
					rs.close();
					state.close();	
				}
				catch(SQLException e){
					e.printStackTrace();
				}
			}
			return v;   
    } 
}
