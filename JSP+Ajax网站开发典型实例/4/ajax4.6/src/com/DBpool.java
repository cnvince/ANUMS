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
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/testajax?useUnicode=true&amp;characterEncoding=gb2312","root","19841025");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		return conn;			
	}
}