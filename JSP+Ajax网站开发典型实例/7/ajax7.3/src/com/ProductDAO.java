package com;
import java.sql.*;

public class ProductDAO
{
	private Connection conn;
	private Statement state;
	private ResultSet rs;

	public ProductDAO()
	{
		if(conn==null)
		{	
			try
			{
				Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspajax?useUnicode=true&amp;characterEncoding=UTF-8","root","19841025");           
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	public String getType()
	{
		StringBuffer TypeInfo=new StringBuffer();
		TypeInfo.append("TypeInfo:[");
		try
		{
			state=conn.createStatement();
			rs=state.executeQuery("select typeid,typename,count(distinct typeid) from product group by typeid");
			while(rs.next())
			{
				TypeInfo.append("{typeid:'"+rs.getString("typeid")+"',typename:'"+rs.getString("typename")+"'},");
			}
			TypeInfo.delete(TypeInfo.length()-1, TypeInfo.length());
			TypeInfo.append("],");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally
		{
			try{
				state.close();
				rs.close();
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		return TypeInfo.toString();
	}	
	
	
	public String getProduct()
	{
		StringBuffer ProductInfo=new StringBuffer();
		ProductInfo.append("{"+getType());
		ProductInfo.append("ProductInfo:[");
		try
		{
			state=conn.createStatement();
			rs=state.executeQuery("select * from product");
			while(rs.next())
			{
				ProductInfo.append("{id:'"+rs.getInt("id")+"',name:'"+rs.getString("name")+"',typeid:'"+rs.getString("typeid")+"',typename:'"+rs.getString("typename")+"'},");
			}
			ProductInfo.delete(ProductInfo.length()-1, ProductInfo.length());
			ProductInfo.append("]}");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally
		{
			try{
				state.close();
				rs.close();
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		return ProductInfo.toString();
	}
}


