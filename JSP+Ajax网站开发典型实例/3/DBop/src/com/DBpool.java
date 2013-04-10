package com;

import java.sql.*;
import javax.naming.*;

public class DBpool
{
	private static Connection conn;
	
	public static Connection getConnection() throws SQLException,NamingException
	{
			try
			{
				Class.forName("com.mysql.jdbc.Driver").newInstance();  //装载数据库连接驱动
		
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user?useUnicode=true&amp;characterEncoding=UTF-8","root","19841025");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}	
		return conn;		
	}
}