package com;
import java.sql.*;

public class PostDAO 
{
	private static Connection conn;
	private Statement state;
	private PreparedStatement pstate;
	private ResultSet rs;

	public PostDAO()
	{
		if(conn==null)
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver").newInstance();   //注册数据库连接驱动
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspajax?useUnicode=true&amp;characterEncoding=utf-8","root","19841025");
			}
			catch(Exception e)
			{e.printStackTrace();}	
		}
	}
    public String getCityByPost(String postcode)   //从数据库中查询与邮编参数相对应的地址信息
    {		
    		String value="";
			try
			{	
				state=conn.createStatement();
				rs=state.executeQuery("select * from postcode where postcode="+postcode);
				if(rs.next())
					value=rs.getString("province")+rs.getString("city");
			}
			catch(SQLException e)
			{e.printStackTrace();}
			finally
			{
				try
				{
					rs.close();
					state.close();	
				}
				catch(SQLException e)
				{e.printStackTrace();}
			}
			return value;
    }    
}
