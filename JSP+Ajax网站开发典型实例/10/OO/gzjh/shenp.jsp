<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%
  String sessionname=(String)session.getAttribute("name");
  String sqq="select gangw from oa_user where zhangh='"+sessionname+"'";
  ResultSet rss=con.getRs(sqq);
  rss.next();
  String gangw=rss.getString("gangw");
  if(gangw.equals("总经理") | gangw.equals("副总经理") | gangw.equals("主任") | gangw.equals("经理")){
%>
<h3 align="center">待审批计划</h3>
<table  width=95% style="font-size:12" align="center">
<th bgcolor="D0DCED">名称</th><th bgcolor="D0DCED">类别</th><th bgcolor="D0DCED">级别</th><th bgcolor="D0DCED">时间</th>
<th bgcolor="D0DCED">具体时间</th><th bgcolor="D0DCED">内容</th><th bgcolor="D0DCED">关联部门</th><th bgcolor="D0DCED">制定人</th><th bgcolor="D0DCED">所属部门</th><th bgcolor="D0DCED">操作</th>
<%
String sql="select * from oa_jihua where sp='0'";
ResultSet rs=con.executeQuery(sql);
int intPageSize;      //一页显示的记录数
int intRowCount;      //记录的总数
int intPageCount;     //总页数
int intPage;         //待显示的页码
String strPage;
int i;
//设置一页显示的记录数
intPageSize=6;
//取得待显示的页码
strPage=request.getParameter("page");
//判断strPage是否等于null,如果是，显示第一页数据
if(strPage==null)
{
intPage=1;
}else{
//将字符串转换为整型
intPage=java.lang.Integer.parseInt(strPage);
}
if(intPage<1)
{
intPage=1;
}
//获取记录总数
rs.last();
intRowCount=rs.getRow();
//计算机总页数
intPageCount=(intRowCount+intPageSize-1)/intPageSize;
//调整待显示的页码
if(intPage>intPageCount) intPage=intPageCount;
if(intPageCount>0)
{
//将记录指针定位到待显示页的第一条记录上
  rs.absolute((intPage-1)*intPageSize+1);
}

i=0;
while(i<intPageSize && !rs.isAfterLast())
{
   int id=rs.getInt("id");
   String mc=rs.getString("mc");
   String leib=rs.getString("leib");
   String jibie=rs.getString("jibie");
   String shij=rs.getString("shij");
   String shit=rs.getString("shit");
   String content=rs.getString("content");
   String gl=rs.getString("gl");
   String jhr=rs.getString("jhr");
   String bum=rs.getString("bum");
   out.print("<tr><td bgcolor='E4EAF4'>"+mc+"</td><td bgcolor='E4EAF4'>"+leib+"</td><td bgcolor='E4EAF4'>"+jibie+"</td><td bgcolor='E4EAF4'>"+shij+"</td><td bgcolor='E4EAF4'>"+shit+"</td><td bgcolor='E4EAF4'>"+content+"</td><td bgcolor='E4EAF4'>"+gl+"</td><td bgcolor='E4EAF4'>"+jhr+"</td><td bgcolor='E4EAF4'>"+bum+"</td><td bgcolor='E4EAF4'><a href='../shenp1?id="+id+"' style='color:04329C'>通过</a></td></tr>");
 rs.next();
 i++;
 }

%>
 <%
 out.print("</table>");
 //关闭连接、释放资源
 rs.close();
 %>
共<%=intRowCount%>个记录，分<%=intPageCount%>页显示，当前页是：第<%=intPage%>页
<%
for(int j=1;j<=intPageCount;j++)
{
out.print("&nbsp;&nbsp;<a href='shenp.jsp?page="+j+"' style='color:04329C'>"+j+"</a>");
}
%>
</div>
<%}else{%>
<p>你不具有审批权限</p>
<%}%>
