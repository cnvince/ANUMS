package com;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class DatabaseDAO
{
	private Connection conn;
	private DatabaseMetaData md;
	private ResultSet t_rs,c_rs;

	public DatabaseDAO()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/testajax?useUnicode=true&amp;characterEncoding=UTF-8","root","19841025");
			md=conn.getMetaData();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
	}
	
	public String getDatabaseInfo()
	{
		StringBuffer DatabaseInfo=new StringBuffer();
		try
		{ 
			 DatabaseInfo.append("DBType:'"+md.getDatabaseProductName()+"',");
			 DatabaseInfo.append("DBName:'"+conn.getCatalog()+"'");			 
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}		
		return DatabaseInfo.toString();
	}
	
	public String getTableInfo()
	{
		StringBuffer allTable=new StringBuffer();
		allTable.append("{"+getDatabaseInfo()+",Tables:[");
		try
		{
			t_rs=md.getTables(conn.getCatalog(),null,"%",new String[]{"TABLE"});
			StringBuffer TableInfo=new StringBuffer();
			while(t_rs.next())
			{				
				String tablename=t_rs.getString("TABLE_NAME");
				c_rs=md.getColumns(conn.getCatalog(),null,tablename,null);
				TableInfo.append("{TableName:'"+tablename+"',");
				TableInfo.append("ColumnInfo:[");
				while(c_rs.next())
				{					
					TableInfo.append("{ColumnName:'"+c_rs.getString("COLUMN_NAME")+"',ColumnType:'"+c_rs.getString("TYPE_NAME")+"',ColumnSize:'"+c_rs.getString("COLUMN_SIZE")+"'},");
				}
				TableInfo.delete(TableInfo.length()-1, TableInfo.length());
				TableInfo.append("]},");
			}
			TableInfo.delete(TableInfo.length()-1, TableInfo.length());
			allTable.append(TableInfo);
			allTable.append("]}");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				t_rs.close();
				c_rs.close();				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}	
		return allTable.toString();
	}
	
}


