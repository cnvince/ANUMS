<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*" %> 
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%! String year; 
  String month; 
%> 
<% month=request.getParameter("month"); 
   year =request.getParameter("year"); 
%> 
<html> 
<head> 
<title>��</title> 
<script src="ajax.js"></script>
<script Language="JavaScript"> 
<!-- 
function changeMonth() 
{ 
var mm="kaob.jsp?month="+document.sm.elements[0].selectedIndex+"&year="+<%=year%>; 
window.open(mm,"_self"); 
} 
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
</head> 
<%! String days[]; %> 
<% 
days=new String[42]; 
for(int i=0;i<42;i++) 
 { 
  days[i]=""; 
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
<body bgcolor="FBFDFD"> 
<table width="100%" border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td  height="13" bgcolor="6C8ACC"> <img src="guide.gif"  align="absmiddle">
      ���ڹ���&gt;&gt;���ſ���</td>


  </tr>
</table>
<FORM name="sm" method="post" action="kaob.jsp"> 
  <%=year%>��  <%=Integer.parseInt(month)+1%>��
<div align=center> 
<%
String name=(String)session.getAttribute("name");
String sql="select bum from oa_kaoqin where zhangh='"+name+"'";
ResultSet rs=con.getRs(sql);
rs.next();
String bum=rs.getString("bum");
out.println(bum+"��Ա���ڼ�¼<br>");
String sq="select * from oa_user where bum='"+bum+"'";
ResultSet rs1=con.getRs(sq);
while(rs1.next()){
int id=rs1.getInt("id");
String na=rs1.getString("name");
out.print(na+":");
 for(int j=0;j<6;j++) {
   for(int i=j*7;i<(j+1)*7;i++) { 
   int yearnum=Integer.parseInt(year);
  int monthnum=Integer.parseInt(month)+1;
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
    <span style="color:red" title="������Ϣʱ��"><%=days[i]%></span> 
   <% }else{
   String ch=na+"/"+s;
%>
    <span  onClick="al(this)" id=<%=ch%>><%=days[i]%></span>  

<%}
}   } %> 

<% } 

out.print("<br>"); }%> 
</div> 

<table border="0" width="168" height="20"> 
<tr bgcolor="E4EBF4"> 
 <td width=30%><select name="month" size="1" onchange="changeMonth()" > 
   <option value="0">һ��</option> 
   <option value="1">����</option> 
   <option value="2">����</option> 
   <option value="3">����</option> 
   <option value="4">����</option> 
   <option value="5">����</option> 
   <option value="6">����</option> 
   <option value="7">����</option> 
   <option value="8">����</option> 
   <option value="9">ʮ��</option> 
   <option value="10">ʮһ��</option> 
   <option value="11">ʮ����</option> 
 </select></td> 
<td width=28%><input type=text name="year" value=<%=year%> size=4 maxlength 
=4></td> 
<td>��</td> 
<td width=28%><input type=submit value="�ύ"></td> 
</tr> 
</table> 
</FORM> 
<script Language="JavaScript"> 
<!-- 
 document.sm.month.options.selectedIndex=<%=month%>; 
//--> 
</script> 
<span style="font-size:10">��ʾ����ĩ��Ϣ���Ժ�ɫ��ʾ��������Ƶ����������Ͽ��Բ鿴ǩ��ʱ�䣬����ɿ��ڲ鿴��</span> 
</body> 
</html>   