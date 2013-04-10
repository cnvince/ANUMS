package test;
import java.sql.*;  

 public class Conn {  
        public static synchronized Connection get() throws Exception{  
           String driverName="com.mysql.jdbc.Driver";
           String userName="root";//�û���
           String userPasswd="111111";//����
           String dbName="oa";//���ݿ���
           String tableName="oa_user";//����
           String url="jdbc:mysql://localhost:3306/"+dbName+"?user="+userName+"&password="+userPasswd;//�����ַ���   Class.forName("com.mysql.jdbc.Driver").newInstance();
           Connection conn=DriverManager.getConnection(url);
           return conn;
        }  
        public void Exec(String sql){
         try{
              Connection conn=get();
              Statement stmt=conn.createStatement();
              stmt.executeUpdate(sql);
         }catch(Exception e){
              System.out.print(e.toString());
          } 
}
public ResultSet getRs(String sql) throws SQLException{
            try{ 
              Connection conn=get();
              Statement stmt=conn.createStatement();
              ResultSet  rs=stmt.executeQuery(sql);
              return rs; 
             }
          catch(Exception e){
                System.out.print(e);
                return null;
          }
     }
public ResultSet executeQuery(String sql) throws Exception 
     { 
        ResultSet rs=null;
        try 
          {  
          Connection conn=get();
          Statement stmt=conn.createStatement();
          stmt=conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,java.sql.ResultSet.CONCUR_READ_ONLY); 
          rs=stmt.executeQuery(sql); 
          return rs;
          } 
      catch(SQLException ex) 
           { 
          System.out.println("sql.executeQuery:"+ex.getMessage());
          return rs; 
           } 
 } 
}



