<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>ʵ�����ݿ�洢����</title>
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
 //������ӣ���Ҫָ�����ݿ�����������URL
  public Connection getConnection(String driver,String url)throws SQLException{
    try{
      Class.forName(driver);
    }catch(ClassNotFoundException e){}
    Connection con=DriverManager.getConnection(url);
    return con;
  }
  //���ݿ���������Ҫָ��һ��������ִ�е�SQL���,���⻹Ҫָ�����ݿ���������ͣ�true��ʾ��ѯ������flase��ʾ���²�������
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
  //�ͷ�����
  public void frees(Connection con,ResultSet rs)throws SQLException{
    if(rs!=null)
      rs.close();
    if(con!=null)
      con.close();
  }
  %>