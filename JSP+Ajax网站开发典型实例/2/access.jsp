<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<html>
  <head>
    <title>Access数据库连接</title>
  </head>
<style type="text/css">
<!--
body {
	background-image: url(images/img.jpg);
}
-->
</style>
<body>
<%

    try
    {
        //以下几项请自行修改
        String path = "D:\\test.mdb";//Access 数据库路径
        String name = "";        //Acvess 数据库用户名，没有则为空
        String pass = "";        //Access 数据库密码，没有则为空
        //数据库连接字符串 
        String url ="jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ="+path; 
        //加载驱动程序
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        //建立连接
        Connection conn= DriverManager.getConnection(url,name,pass); 
        out.print("<br><center>恭喜你！Access数据库连接成功！</center>");
        conn.close();                                //关闭连接对象
    }catch(Exception e){
        out.print("数据库连接错误！,错误信息如下：<br>");
        out.print(e.getMessage());
        }
%>
</body>
</html>