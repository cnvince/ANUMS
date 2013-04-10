<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%! String year; 
  String month; 
%> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
<title>日</title> 
<script src="ajax.js"></script>
<script src="oa.js"></script>
<script type="text/javascript">
function a(str){
   send(str);
  }

function send(st){
   createXMLHttpRequest();
   var str="title="+st;
   var url="kaoq1.jsp";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(str);
}

function callback(){
   if(xmlHttp.readyState==4){
       var str=xmlHttp.responseText;
        if(trim(str)=="1")
            { alert("谢谢，考勤执行完成");
              window.location.reload();  
            }
    }
}
function xian(sss){
  createXMLHttpRequest();
  var year=document.getElementById('year').value;
  var month=document.getElementById('month').value;
  var date=sss.id;
  var ti="year="+year+"&month="+month+"&date="+date;
  var url="day0.jsp";
   xmlHttp.open("POST",url,true);
   xmlHttp.onreadystatechange=cb;
   xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  
   xmlHttp.send(ti);

}
function cb(){
if(xmlHttp.readyState==4){
   alert(xmlHttp.responseText);
  }
}
</script>
</head> 
<%! String days[]; %> 
<% 
days=new String[42]; 
for(int i=0;i<42;i++) 
 { 
  days[i]=" "; 
 } 
%> 
<% 
Calendar thisMonth=Calendar.getInstance(); 
 if(month!=null&&(!month.equals("null"))) 
  thisMonth.set(Calendar.MONTH, Integer.parseInt(month) ); 
 if(year!=null&&(!year.equals("null"))) 
  thisMonth.set(Calendar.YEAR, Integer.parseInt(year) ); 
 year=String.valueOf(thisMonth.get(Calendar.YEAR)); 
month=String.valueOf(thisMonth.get(Calendar.MONTH)); 
thisMonth.setFirstDayOfWeek(Calendar.SUNDAY); 
thisMonth.set(Calendar.DAY_OF_MONTH,1); 
int firstIndex=thisMonth.get(Calendar.DAY_OF_WEEK)-1; 
int maxIndex=thisMonth.getActualMaximum(Calendar.DAY_OF_MONTH); 
for(int i=0;i<maxIndex;i++) 
 { 
  days[firstIndex+i]=String.valueOf(i+1); 
 } 
%> 
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" >
  <tr bgcolor="6C8ACC">
    <td  height="13" > <img src="guide.gif"  align="absmiddle">
      考勤管理&gt;&gt;我的考勤</td>
  </tr>
</table>
<br>
<%
String name=(String)session.getAttribute("name");
SimpleDateFormat formatter1 = new SimpleDateFormat ("yyyy-MM-dd");  
String Add_time1 = formatter1.format(new java.util.Date()); 
String sql="select * from oa_kaoqin where  to_days(kqt)=to_days('"+Add_time1+"') and zhangh='"+name+"'";
ResultSet rs=con.getRs(sql);
if(rs.next())
{
String d1=rs.getString("skr");
String d2=rs.getString("skc");
String d3=rs.getString("xkr");
String d4=rs.getString("xkc");
if(d1!=null & d2==null){
%>  
  <input type="button" value="上午考勤签出"  id="sqc" onClick="a('上午考勤签出')"> 
<%}
if(d1!=null & d2!=null & d3==null){
%>
<input type="button" value="下午考勤签入"  id="xqr" onClick="a('下午考勤签入')"> 
<%}
if(d1!=null & d2!=null & d3!=null & d4==null){
%>
<input type="button" value="下午考勤签出"  id="xqc" onClick="a('下午考勤签出')"> 
<%}
if(d1!=null & d2!=null & d3!=null & d4!=null){
%>
  <p>考勤结束</p>
<%
}}
else{
%>
<input type="button" value="上午考勤签入" onClick="a('上午考勤签入')" id="sqr">
<%}%>
<div id="aa"></div>
<hr>
<FORM name="sm" method="post" action=""> 
 <div style="background:D9E5F4"> <%=year%>年  <%=Integer.parseInt(month)+1%>月份我的考勤</div> 
<table border="0" width="89%" height="81"> 
<div align=center> 
 <tr> 
   <th width="25" height="16" bgcolor="ECF2EC"><font color="red">日</font> 
</th> 
   <th width="25" height="16" bgcolor="ECF2EC">一</th> 
   <th width="25" height="16" bgcolor="ECF2EC">二</th> 
   <th width="25" height="16" bgcolor="ECF2EC">三</th> 
   <th width="25" height="16" bgcolor="ECF2EC">四</th> 
   <th width="25" height="16" bgcolor="ECF2EC">五</th> 
   <th width="25" height="16" bgcolor="ECF2EC"><font color="green">六</font></th> 
 </tr> 
<% for(int j=0;j<6;j++) { %> 
<tr> 
     <% for(int i=j*7;i<(j+1)*7;i++) {
         String m=days[i];
    %> 
    <td width="15%" height="16"  valign="middle" align="center"> 
    <input type=hidden id="year" value=<%=year%>>
    <input type=hidden id="month" value=<%=Integer.parseInt(month)+1%>>
    <p style="color:blue;cursor:hand;" id=<%=m%>  onClick="xian(this)" ><%=m%></p></td> 
   <% }  %> 
 </tr> 
<% }  %> 
</div> 
</table> 
</FORM> 
<p style="font-size:10">鼠标单击相应的日期，可以查看该天的考勤情况</p>
</body> 
</html>   