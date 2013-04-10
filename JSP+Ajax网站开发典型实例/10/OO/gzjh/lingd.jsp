<%@ page contentType="text/html; charset=GB2312" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<html>
<head>
<title>menu</title>
<script src="oa.js"></script>
<script src="ajax.js"></script>
<script type="text/javascript">
function getD(){
  var r=document.getElementById("ry");
  var ry=r.options[r.selectedIndex].text;
  var tid=document.getElementById("timeid");
  var timeid=tid.options[tid.selectedIndex].text;
  createXMLHttpRequest();
  var url="lingd1.jsp?ry="+ry+"&timeid="+timeid;
   xmlHttp.open("GET",url,true);
   xmlHttp.onreadystatechange=callback;
   xmlHttp.send(null);
}
function callback(){
   if(xmlHttp.readyState==4){
        show();
	  }
}
function show(){
   var xmlDoc=xmlHttp.responseXML;
   var content=xmlDoc.getElementsByTagName("content");
   var num=0;
   if(content.length==0){
        document.getElementById("showdata").innerHTML="<span style='font-size:20;color:red'>查询记录不存在</span>";
      }
   else{
   var ta="<table border=0 width=90%><th bgcolor='D0DCED'>名称</th><th bgcolor='D0DCED'>级别</th><th bgcolor='D0DCED'>状态</th><th bgcolor='D0DCED'>时间</th>";
   for(var i=0;i<content.length;i++){
      var y=content[i];
      ta+="<tr><td bgcolor='E4EAF4'>"+y.childNodes[0].firstChild.data+"</td>";
	  ta+="<td bgcolor='E4EAF4'>"+y.childNodes[1].firstChild.data+"</td>";
	  ta+="<td bgcolor='E4EAF4'>"+y.childNodes[2].firstChild.data+"</td>";
	  ta+="<td bgcolor='E4EAF4'>"+y.childNodes[3].firstChild.data+"</td>";
      ta+="</tr>";
      
   }
   ta+="</table>";
   document.getElementById("showdata").innerHTML=ta;
  }
}
</script>
</head>
<body   topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
    <td height="13" class="guide">
	<img src="guide.gif"  align="absmiddle">
    工作计划&gt;&gt;领导查询
	</td>
  </tr>
</table>

<form name="form1" method="post" action="">
  <table width="100%" border="0" cellpadding="1" cellspacing="1" >
    <tr>
      <td colspan="2" >&nbsp;</td>
    </tr>
    <tr>
      <td width="18%" height="25" bgcolor="D0DCED">选择人员</td>
	  <td bgcolor="D0DCED">
	  <select id="ry">
	     <%
	       String sql="select * from oa_user;";
               ResultSet rs=con.getRs(sql);
               while(rs.next()){
                   String zhangh=rs.getString("zhangh");
                   String name=rs.getString("name");
                   String gangw=rs.getString("gangw");
                   String str=zhangh+"/"+name+"/"+gangw;
                   out.print("<option>"+str+"</option>");
                } 
		%>
	  </select>
	  </td>
     </tr>
    <tr>
      <td bgcolor="D0DCED">时间类型</td>
      <td bgcolor="D0DCED"><select  id="timeid">
          <option value="0">全部</option>
          <option value="2" >周计划</option>
          <option value="3" >月计划</option>
		  <option value="5" >季度计划</option>
          <option value="4" >年计划</option>
        </select>
		</td>
    </tr>
  </table>

  <br>
  <table border="0" cellpadding="0" cellspacing="0">
<%
  String sessionname=(String)session.getAttribute("name");
  String sqq="select gangw from oa_user where zhangh='"+sessionname+"'";
  ResultSet rss=con.getRs(sqq);
  rss.next();
  String gangw=rss.getString("gangw");
  if(gangw.equals("总经理") | gangw.equals("副总经理") | gangw.equals("主任") | gangw.equals("经理")){
%>
    <tr> 
      <td width="50" align="center" ><input type="button" value="查 询" onclick="getD()" ></td>
      <td width="50" align="center"><input type="reset" value="重 置"></td>
    </tr>
<%}else{
%>
    <tr> 
      <td width="100" align="center" colspan=2><span style="font-size:12;color:red">你不具备查询权限</td>
      
    </tr>
<%}%>
  </table>
</form>
<div id="showdata"></div>
</body>
</html>
