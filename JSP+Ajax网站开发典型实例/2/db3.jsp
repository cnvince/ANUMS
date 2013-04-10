<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>实现数据库存储过程</title>
  </head>
<style type="text/css">
<!--
body {
	background-image: url(images/img.jpg);
}
-->
</style>

  <body>
  </body>
</html>
 <%!
 //获得连接，需要指定数据库驱动与连接URL
  public Connection getConnection(String driver,String url)throws SQLException{
    try{
      Class.forName(driver);
    }catch(ClassNotFoundException e){}
    Connection con=DriverManager.getConnection(url);
    return con;
  }
  //数据库库操作，需要指定一个连接与执行的SQL语句,另外还要指定数据库操作的类型（true表示查询操作，flase表示更新操作）。
  public ResultSet getResultSet(Connection con,String sql,boolean type)throws SQLException{
    Statement st=con.createStatement();
    if(!type){
      st.executeUpdate(sql);
      return null;
    }else{
      ResultSet rs=st.executeQuery(sql);
      return rs;
    }
  }
  //释放连接
  public void frees(Connection con,ResultSet rs)throws SQLException{
    if(rs!=null)
      rs.close();
    if(con!=null)
      con.close();
  }
  %>