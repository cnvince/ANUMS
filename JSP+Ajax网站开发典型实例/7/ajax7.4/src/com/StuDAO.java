package com;
import java.sql.*;

public class StuDAO 
{
	private static Connection conn;
	private Statement state;
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
    public String getInfoBySort(String where,String colname,String type)
    {		
    		StringBuffer sb=new StringBuffer();
    		sb.append("{stu:[");
			try
			{	
				state=conn.createStatement();
				rs=state.executeQuery("select * from sort where "+where+" order by "+colname+" "+type);//排序查询
				while(rs.next())
					sb.append("{name:'"+rs.getString("name")+"',age:'"+rs.getInt("age")+"',chengji:'"+rs.getInt("chengji")+"'},");
				sb.delete(sb.length()-1,sb.length());
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
}
