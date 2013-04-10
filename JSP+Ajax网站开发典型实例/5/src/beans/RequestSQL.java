package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class RequestSQL {
	   private Statement st=null;
	   private boolean ok=false;
	   private String name=null;
	   public boolean check()throws Exception{
		   checkSQL(this.name);
		   return this.ok;
	   }
	   public void setName(String name) {
		this.name = name;
	   }
	   public String getName() {
		return name;
	   }
	   public int insertUser(String sql)throws Exception{
		   set();
		   return st.executeUpdate(sql);
	   }
	   private void checkSQL(String name) throws Exception{
		        set();
				ResultSet rs=st.executeQuery("select * from users where name='"+name+"'");
				if(rs.next()){
					this.ok=true;
				}else{
					this.ok=false;
				}
	   }
	   private void set()throws Exception{
		   Class.forName("com.mysql.jdbc.Driver");
	    	String url="jdbc:mysql://localhost:3306/user?user=root&password=tmq&characterEncoding=gb2312";
			Connection con=DriverManager.getConnection(url);
			st=con.createStatement();
	   }
}
