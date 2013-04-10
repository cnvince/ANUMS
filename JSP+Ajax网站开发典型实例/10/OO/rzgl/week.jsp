<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<html>
<head>
<title>一周日志列表</title>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
    <td > <img src="guide.gif"  align="absmiddle">
      日志 &gt;&gt;一周日志列表 </td>
  </tr>
</table>
<table border="0" cellpadding="0" cellspacing="8">
  <tr>
    <td class="whitebg">
      <table height="22" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="4" height="24" >&nbsp;</td>
          <td height="23" align="center" valign="middle"> 

		<a href="xinj.jsp" style="color:black;text-decoration:none"><img src=func_new.gif>添加日志</a>		  </td>
          <td width="4" height="24" align="right" >&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<p>一周日志记录</p>
<%
  Calendar rightNow = Calendar.getInstance();
  rightNow.setTime(new java.util.Date());
  String[] dayNames = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五","星期六"};
   for(int i=0;i<7;i++){
           rightNow.set(Calendar.DAY_OF_WEEK, rightNow.getFirstDayOfWeek()+i);
           out.print(dayNames[i]+"       ");
           int year=rightNow.get(Calendar.YEAR);
           int month=rightNow.get(Calendar.MONTH)+1;
           int day=rightNow.get (Calendar.DAY_OF_MONTH);
           String da=year+"-"+month+"-"+day; 
           out.print(da+"<br><br>");
           String sql="select * from oa_rizhi where to_days(rizit)=to_days('"+da+"')";
           ResultSet rs=con.getRs(sql);
           while(rs.next()){
                int id=rs.getInt("id");
                String title=rs.getString("title");
                if(title==null)
                    title="";
               out.print("<a href='rizx.jsp?id="+id+"'>"+title+"</a><br><br>");
            }

     }   
%>

</body>
</html>
