package com;

import com.*;
import java.util.Vector;
import java.sql.*;
import javax.naming.*;


public class ShoppingDAO
{
	private Connection conn;
	private Statement state;
	private PreparedStatement pstate;
	private ResultSet rs;
	

	public ShoppingDAO()
	{
		if(conn==null)
		{
			
			try
			{
				conn=DBpool.getConnection();        //������ݿ����Ӷ���
					
			}
			catch(NamingException e)
			{
				e.printStackTrace();
			}
			catch(SQLException se)
			{
				se.printStackTrace();
			}
		}

	}
	
    public Vector getShopping()                //��ѯ��ǰ���ﳵ�е���Ʒ��Ϣ
    {
		    Vector v=new Vector();
			
			try
			{	
				state=conn.createStatement();
				rs=state.executeQuery("select * from shopping");
				while(rs.next())
				{	
					ShoppingBean sb=new ShoppingBean(rs.getInt(1),rs.getString(2),rs.getDouble(3));
					v.add(sb);
		
				}
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
    
    public ShoppingBean getShoppingById(String id)
    {	   
    	    ShoppingBean sb=new ShoppingBean();
			
			try
			{	
				state=conn.createStatement();
				rs=state.executeQuery("select * from shopping where id="+id);
				if(rs.next())
				{
					sb.setId(rs.getInt("id"));
					sb.setName(rs.getString("name"));
					sb.setNum(rs.getDouble("num"));
				}
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
			return sb;   
    }
    
    public boolean addShopping(ShoppingBean sb)     //���ﳵ�������Ʒ
    {
    		int jg=0;   		
			try
			{	
				pstate=conn.prepareStatement("insert into shopping (name,num) values (?,?)");
				pstate.setString(1,sb.getName());
				pstate.setDouble(2,sb.getNum());

				jg=pstate.executeUpdate();
						
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				try
				{
					pstate.close();	
				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}	
			}

			if(jg>0)
				return true;
			else 
				return false;  
    	
    }
    public boolean updateShopping(ShoppingBean sb)    //�޸Ĺ��ﳵ�е���Ʒ��Ϣ
    {
			int jg=0;			
			try
			{	
				pstate=conn.prepareStatement("update shopping set num=? where id=?");
				pstate.setDouble(1,sb.getNum());
				pstate.setInt(2,sb.getId());

				jg=pstate.executeUpdate();				
			
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				try
				{
					pstate.close();	
				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}	
			}
			if(jg>0)
				return true;   	
			return false;   	
    }
    public boolean delShopping(String id)     //�ӹ��ﳵ��ɾ����Ʒ
    {   		
			int jg=0;
			
			try
			{	
				state=conn.createStatement();
				jg=state.executeUpdate("delete from shopping where id in ("+id+")");				
			
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				try
				{
					state.close();	
				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}
	
			}
			if(jg>0)
				return true;   	
			return false;
    }  
}


