<%@ page language="java" import="java.util.*,com.*" pageEncoding="utf-8"%>

<html>
  <head></head>
  <body>
    <%
    int pageb;    //存储当前页码
    if(request.getQueryString()==null)
    	 pageb=1;
    else 
    	 pageb=Integer.parseInt(request.getParameter("page"));
    	 
    UserDAO ud=new UserDAO();
 	Vector v= ud.split(pageb,5);    //调用分页方法
     %>
     <center>
     <table width="60%" border="1">
     <tr><td align="center">姓名</td><td align="center">年龄</td></tr>
     <%
     for(int j=0;j<v.size();j++)
     {
     	UserBean ub=new UserBean();
     	ub=(UserBean)v.get(j);
     %>
     <tr><td align="center"><%=ub.getName() %></td><td align="center"><%=ub.getAge() %></td></tr>
     <% 
     }
      %>
      <tr><td colspan="2" align="center"><a href="userList.jsp?page=1">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=userList.jsp?page=<% if(pageb-1<=1) out.print(1); else out.print((pageb-1)); %>>上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="userList.jsp?page=<% if(pageb+1>=ud.pageT) out.print(ud.pageT); else out.print((pageb+1)); %>">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=userList.jsp?page=<%=ud.pageT %>>尾页</a></td></tr>
     </table>
     </center>
  </body>
</html>
