<%@ page contentType="text/html; charset=gb2312" %>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%
 String driverName="com.mysql.jdbc.Driver";
 String userName="root";//数据库用户名
 String userPasswd="tmq";//密码
 String dbName="friend";//数据库名 
//连接字符串
String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPasswd;
Class.forName(driverName).newInstance();
Connection connection=DriverManager.getConnection(url);
Statement statement = connection.createStatement();
//每页显示记录数
int PageSize = 8;
int StartRow = 0; //开始显示记录的编号 
int PageNo=0;//需要显示的页数
int CounterStart=0;//每页页码的初始值
int CounterEnd=0;//显示页码的最大值
int RecordCount=0;//总记录数;
int MaxPage=0;//总页数
int PrevStart=0;//前一页
int NextPage=0;//下一页
int LastRec=0; 
int LastStartRecord=0;//最后一页开始显示记录的编号 
//获取需要显示的页数，由用户提交
if(request.getParameter("PageNo")==null){ //如果为空，则表示第1页
  if(StartRow == 0){
     PageNo = StartRow + 1; //设定为1
  }
}else{
  PageNo = Integer.parseInt(request.getParameter("PageNo")); //获得用户提交的页数
  StartRow = (PageNo - 1) * PageSize; //获得开始显示的记录编号
}
//根据当前的页数显示一定数量的页面链接
//设置显示页码的初始值!!
  if(PageNo % PageSize == 0){
   CounterStart = PageNo - (PageSize - 1);
  }else{
   CounterStart = PageNo - (PageNo % PageSize) + 1;
  }
CounterEnd = CounterStart + (PageSize - 1);
%>
<html>
<head>
<title>分页显示记录</title>
<style type="text/css">
<!--
body {
	background-image: url(images/img.jpg);
}
-->
</style>
</head>
<%
//获取总记录数
ResultSet rs = statement.executeQuery("select count(*) from friends" ); 
rs.next(); 
RecordCount = rs.getInt(1);
rs = statement.executeQuery("SELECT id,name,tel FROM friends ORDER BY id DESC LIMIT "
       +StartRow+", "+PageSize);
//获取总页数
MaxPage = RecordCount % PageSize;
if(RecordCount % PageSize == 0){
  MaxPage = RecordCount / PageSize;
}else{
   MaxPage = RecordCount/PageSize+1;
}
%>
<body><center>
<p><b><%="分页显示记录("+PageNo+"/"+MaxPage+")" %></b></p>
<br>
<table width="450" border="1">
  <tr> 
    <th>编号</th>
    <th>姓名</th>
    <th >电话</th>
  </tr>
<%
while (rs.next()) {
%>
 <tr> 
    <td><%=rs.getString("id")%></td>
    <td><%=rs.getString("name")%></td>
    <td><%=rs.getString("tel")%></td>
  </tr>
<%
}%>
</table>
<br>
<table width="100%" border="1">
  <tr>
   <td><div align="center">
<%
   out.print("<font size=4>");
  //显示第一页或者前一页的链接
  //如果当前页不是第1页，则显示第一页和前一页的链接
  if(PageNo != 1){
    PrevStart = PageNo - 1;
    out.print("<a href=db5.jsp?PageNo=1>第一页 </a>: ");
    out.print("<a href=db5.jsp?PageNo="+PrevStart+">前一页</a>");
  }
  out.print("[");

   //打印需要显示的页码
   for(int c=CounterStart;c<=CounterEnd;c++){
   if(c <MaxPage){
     if(c == PageNo){
       if(c %PageSize == 0){
         out.print(c);
       }else{
          out.print(c+" ,");
       }
     }else if(c % PageSize == 0){
        out.print("<a href=db5.jsp?PageNo="+c+">"+c+"</a>");
     }else{
        out.print("<a href=db5.jsp?PageNo="+c+">"+c+"</a> ,");
     }
   }else{
     if(PageNo == MaxPage){
      out.print(c);
      break;
     }else{
        out.print("<a href=db5.jsp?PageNo="+c+">"+c+"</a>");
     break;
   }
  }
}

out.print("]");;

if(PageNo < MaxPage){ //如果当前页不是最后一页，则显示下一页链接
    NextPage = PageNo + 1;
    out.print("<a href=db5.jsp?PageNo="+NextPage+">下一页</a>");
}

//同时如果当前页不是最后一页，要显示最后一页的链接
if(PageNo < MaxPage){
   LastRec = RecordCount % PageSize;
   if(LastRec == 0){
      LastStartRecord = RecordCount - PageSize;
   }
   else{
      LastStartRecord = RecordCount - LastRec;
   }

   out.print(":");
    out.print("<a href=db5.jsp?PageNo="+MaxPage+">最后一页</a>");
  }
  out.print("</font>");
%>
</div>
</td>
</tr>
</table>
<%
  rs.close();
  statement.close();
   connection.close();
%>
</center>
</body>
</html>

