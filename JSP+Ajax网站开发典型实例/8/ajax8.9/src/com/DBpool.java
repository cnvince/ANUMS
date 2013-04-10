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
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspajax?useUnicode=true&amp;characterEncoding=utf-8","root","19841025");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		return conn;			
	}
}