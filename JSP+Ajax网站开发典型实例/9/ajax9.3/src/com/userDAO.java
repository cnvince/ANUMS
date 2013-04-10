package com;
import java.sql.*;

public class userDAO 
{
	private static Connection conn;
	private Statement state;
	private ResultSet rs;

	public userDAO()
	{
		if(conn==null){
			try{
				Class.forName("com.mysql.jdbc.Driver").newInstance(); //装置数据库连接驱动
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspajax?useUnicode=true&amp;characterEncoding=utf-8","root","19841025");
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
	}
    public int addUser(String name,String realname,String pwd,String email,String phone,String address)//添加记录
    {		
    		int v=0;
			try{	
				state=conn.createStatement();
				rs=state.executeQuery("select * from user where logname='"+name+"'");  //重名查询
				if(rs.next())
					v=0;
				else
					v=state.executeUpdate("insert into user values('"+name+"','"+realname+"','"+pwd+"','"+email+"','"+phone+"','"+address+"')");

			}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally
			{
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
