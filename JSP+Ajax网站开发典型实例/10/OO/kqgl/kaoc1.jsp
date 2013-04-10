<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*" %> 
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<script src="ajax.js"></script>
<script Language="JavaScript"> 
<!-- 
function al(ob){
  id=ob.id;
  createXMLHttpRequest();
  var url="dl.jsp?key="+ob.id;
  xmlHttp.open("GET",url,true);
  xmlHttp.onreadystatechange=Dl;
  xmlHttp.send(null);
}

function Dl(){
   if(xmlHttp.readyState==4){
        alert(xmlHttp.responseText);
     }
}


//--></script>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td  height="13" bgcolor="6C8ACC"> <img src="guide.gif"  align="absmiddle">
      考勤管理&gt;&gt;考勤列表(今天是 2008年5月29日 )</td>
  </tr>
</table>
<br><br><br>
<%! String days[]; %> 
<%
days=new String[42]; 
for(int i=0;i<42;i++) 
 { 
  days[i]=""; 
 } 
 String user=request.getParameter("user");
 if(user.equals("")){
    response.sendRedirect("kaoc.jsp");
 }
else{
   user=new String(user.getBytes("iso-8859-1"));
   String year=request.getParameter("year");
   String month=request.getParameter("month");
   String ss=year+"-"+month+"-1";
   out.print("<div style='background:E1EAF4'>"+year+"年"+month+"月考勤记录</div><br>");
   String sql="select * from oa_kaoqin where name='"+user+"' and month(kqt)=month('"+ss+"')";
   ResultSet rs=con.getRs(sql);
   ///////////////////
   
   if(rs.next())
    {
       int id=rs.getInt("id");
       String name=rs.getString("name");
	out.print(name);
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
       for(int i=0;i<=maxIndex;i++) 
        { 
          days[firstIndex+i]=String.valueOf(i+1); 
         }  
  for(int j=0;j<6;j++) {
   for(int i=j*7;i<(j+1)*7;i++) { 
   int yearnum=Integer.parseInt(year);
  int monthnum=Integer.parseInt(month);
  String datenum=days[i];
  if(datenum!=null & !datenum.equals("")){
    int datenum1= Integer.parseInt(datenum.trim());
    String s = yearnum+"-"+monthnum+"-"+datenum1;
   SimpleDateFormat sdfInput = new SimpleDateFormat("yyyy-MM-dd");
    Calendar calendar = Calendar.getInstance();
   java.util.Date date = new java.util.Date();
  try {
               date = sdfInput.parse(s);
  } catch (ParseException e) {
              e.printStackTrace();
  }
  calendar.setTime(date);
  int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK)-1;
  if(dayOfWeek<0)dayOfWeek=0;
   if(dayOfWeek==6 | dayOfWeek==0){

%> 
    <span style="color:red" title="今天信息时间"><%=days[i]%></span> 
   <% }else{
   String ch=name+"/"+s;
%>
    <span  onClick="al(this)" id=<%=ch%>><%=days[i]%></span>  

<%}
}  
   }
 }
out.print("<br>");
}


 /////////////////
   else{

       out.print("该员工不存在，请确认后查找");
    }
}
%>
<br><br><br><br>
<span style="font-size:10">提示：周末休息日以红色显示；将鼠标移到日期数字上,单击可以查看考勤情况，即完成考勤查看。</span>
</body>