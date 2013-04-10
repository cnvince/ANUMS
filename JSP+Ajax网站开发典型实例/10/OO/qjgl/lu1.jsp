<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%
try
 {
String sql="select * from oa_qingjia where ischu='1'";
ResultSet rs=con.executeQuery(sql);
int intPageSize;      //一页显示的记录数
int intRowCount;      //记录的总数
int intPageCount;     //总页数
int intPage;         //待显示的页码
String strPage;
int i;
//设置一页显示的记录数
intPageSize=3;
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
//下面用于显示数据
i=0;
  StringBuffer content=new StringBuffer(""); 
  response.setContentType("text/xml"); 
  response.setHeader("Cache-Control","no-cache");
  content.append("<?xml version=\"1.0\"   encoding=\"UTF-8\" ?>");
  content.append("<contents>");
while(i<intPageSize && !rs.isAfterLast())
{
     
     int id=rs.getInt("id");
     String title1=rs.getString("title");
     String type=rs.getString("type");
     String qjr=rs.getString("qjr");
     String bum=rs.getString("bum");
     String starttime1=rs.getString("starttime");
     String endtime1=rs.getString("endtime");
     String tt=starttime1+"至"+endtime1;
      content.append("<content>");
     content.append("<id>"+id+"</id>");
     content.append("<title>"+title1+"</title>");
     content.append("<type>"+type+"</type>");
     content.append("<qjr>"+qjr+"</qjr>");
     content.append("<bum>"+bum+"</bum>");
     content.append("<tt>"+ tt+"</tt>");
     content.append("</content>");
 rs.next();
 i++;
 }
 content.append("</contents>");
 out.print(content);
 }
 catch(Exception e)
 {
 e.printStackTrace();
 }
 %>