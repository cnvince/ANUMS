package com;
import java.sql.*;

public class StuDAO 
{
	private static Connection conn;
	private Statement state;
	private PreparedStatement pstate;
	private ResultSet rs;

	public StuDAO()
	{
		if(conn==null)
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver").newInstance();//装载数据库连接驱动
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspajax?useUnicode=true&amp;characterEncoding=utf-8","root","19841025");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}			
		}
	}
    public String getInfoBySort(String colname,String type)
    {		
    		String v="";
			try
			{	
				state=conn.createStatement();
				rs=state.executeQuery("select * from sort order by "+colname+" "+type);//排序查询
				while(rs.next())
					v=v.concat(rs.getString("name")+","+rs.getInt("age")+","+rs.getInt("chengji")+";");	
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
}
