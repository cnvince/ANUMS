<%@ page language="java" import="javax.naming.*,javax.sql.*,java.sql.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>���ݿ����ӳ�</title>
  </head>
<style type="text/css">
<!--
body {
	background-image: url(images/img.jpg);
}
-->
</style>
  <%
         DataSource pool=null;
         Context env = null;
         Connection con=null;
         Statement st=null;
         ResultSet rs=null;
         
          try {
              env = (Context) new InitialContext().lookup("java:comp/env");
              pool = (DataSource)env.lookup("jdbc/DBPool");
              if(pool==null) 
                  out.println("�Ҳ���ָ�����ӳ�");
             con= pool.getConnection() ;
             st=con.createStatement();
             rs = st.executeQuery("select * from students");
         } catch(Exception ne) {
                 out.print(ne.toString());
         }
  %>
  <body>
  <p align="center"><b>ѧ������һ����</b></p>
  <table width="600" border="1" align="center">
  <tr>
    <th scope="col">ѧ��</th>
    <th scope="col">����</th>
    <th scope="col">��ַ</th>
    <th scope="col">�绰</th>
  </tr>
  <% while(rs.next()){%>
  <tr>
    <td><%=rs.getInt(1) %></td>
    <td><%=rs.getString(2) %></td>
    <td><%=rs.getString(3) %></td>
    <td><%=rs.getString(4) %></td>
  </tr>
  <% }
     if(rs!=null)
       rs.close();
     if(st!=null)
       st.close();
     if(con!=null)
       con.close();
  %>
</table>
  </body>
</html>