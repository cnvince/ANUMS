<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<html>
  <head>
    <title>ͨѶ¼</title>
  </head>
<style type="text/css">
<!--
body {
	background-image: url(images/img.jpg);
}
-->
</style>

  <body>
  <center>
<b><br>ͨѶ¼һ����</b>
<table width="450" border="0" cellpadding="1" bgcolor="#000000">
  <tr>
    <th bgcolor="#FFFFFF" scope="col">���</th>
    <th bgcolor="#FFFFFF" scope="col">����</th>
    <th bgcolor="#FFFFFF" scope="col">�绰</th>
  </tr>
  <%! ResultSet rs=null;%>
  <%
  int type=-1;
  try{
      type=Integer.parseInt(request.getParameter("do"));
    }catch(Exception eee){
      type=0;
    }
  try{
    Statement st=getStatement();
    String name=request.getParameter("name");
    switch(type){
      case 0: 
        rs=st.executeQuery("select * from friends");
        break;
      case 1:
        name=new String(name.getBytes("ISO-8859-1"));
        rs=st.executeQuery("select * from friends where name like '%"+name+"%'");
        break;
      case 2:
        name=new String(name.getBytes("ISO-8859-1"));
        st.executeUpdate("delete from friends where name='"+name+"'");
        response.sendRedirect("db1.jsp");
        break;
      case 3:
        name=new String(name.getBytes("ISO-8859-1"));
        String tel=request.getParameter("tel");
        st.executeUpdate("insert friends values('0','"+name+"','"+tel+"')");
        response.sendRedirect("db1.jsp");
        break;
      case 4:
        name=new String(name.getBytes("ISO-8859-1"));
        tel=request.getParameter("tel");
        String sql="update friends set tel='"+tel+
                "' where name='"+name+"'";
        st.executeUpdate(sql);
        response.sendRedirect("db1.jsp");
        break;  
    }
    
   
    while(rs.next()){
   %>
  <tr>
    <td  bgcolor="#FFFFFF"><%=rs.getInt("id") %></td>
    <td  bgcolor="#FFFFFF"><%=rs.getString("name") %></td>
    <td  bgcolor="#FFFFFF"><%=rs.getString("tel") %></td>
  </tr>
  <%}
    rs.close();//�ر�rs����
    st.close();//����st����
  }catch(Exception ee){
      out.print(ee.toString());
  } %>
</table>
<b>ͨѶ¼����</b>
  <table width="450" border="0" cellpadding="1" bgcolor="#000000">
    <tr>
      <td bgcolor="#FFFFFF"><form id="form1" name="form1" method="post" action="db1.jsp">
        <div align="left">
		  <input type="hidden" name="do" value="1" />
          <input type="text" name="name" value="����"/>
          <input type="submit" name="Submit" value="��ѯ" />
              </div>
      </form></td>
      <td bgcolor="#FFFFFF"><form id="form2" name="form2" method="post" action="db1.jsp">
        <div align="left">
		  <input type="hidden" name="do" value="2" />
          <input type="text" name="name" value="����"/>
          <input type="submit" name="Submit2" value="ɾ��" />
              </div>
      </form></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><form id="form3" name="form3" method="post" action="db1.jsp">
	  <input type="hidden" name="do" value="3" />
    <p align="left">
      <input type="text" name="name" value="����" />
    </p>
    <p align="left">
      <input type="text" name="tel" value="�绰"/>
      <input type="submit" name="Submit22" value="���" />
    </p>
  </form></td>
      <td bgcolor="#FFFFFF"><form id="form4" name="form4" method="post" action="db1.jsp">
	  <input type="hidden" name="do" value="4" />
    <p align="left">
      <input type="text" name="name" value="����"/>
    </p>
    <p align="left">
      <input type="text" name="tel" value="�绰"/>
      <input type="submit" name="Submit222" value="�޸�" />
    </p>
  </form></td>
    </tr>
  </table>
  </center>
  </body>
</html>
<%!
//�������ݿ⣬ȡ��Statement����
public Statement getStatement(){
  try{
     Class.forName("com.mysql.jdbc.Driver");
	 String url="jdbc:MySQL://localhost:3306/friend?user=root&password=tmq&characterEncoding=gb2312";
	 Connection con=DriverManager.getConnection(url);
	 return con.createStatement();
  }catch(Exception e){return null;}
}
%>

