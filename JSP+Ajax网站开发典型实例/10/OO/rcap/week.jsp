<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<html>
<head>
<title>
һ���ճ̰���
</title>
</head>

<body topmargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="6C8ACC">
        <td height="13" class="guide"> <img src="guide.gif" align="absmiddle"> 
			�ճ̰���&gt;&gt;һ���ճ�&gt;&gt;
<%
   Calendar Now = Calendar.getInstance();
   Now.setTime(new java.util.Date());
   int y=Now.get(Calendar.YEAR);
   int m=Now.get(Calendar.MONTH)+1;
   out.print(y+"��"+m+"��");
%>
</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" dwcopytype="CopyTableRow">
  <tr>
    <td align="right" class="whitebg">&nbsp;</td>
  </tr>
</table>
<%
  Calendar rightNow = Calendar.getInstance();
  rightNow.setTime(new java.util.Date());
  String[] dayNames = {"������", "����һ", "���ڶ�", "������", "������", "������","������"};
   for(int i=0;i<7;i++){
           rightNow.set(Calendar.DAY_OF_WEEK, rightNow.getFirstDayOfWeek()+i);
           out.print("<span style='color:6C8ACC'>"+dayNames[i]+"      </span>");
           int year=rightNow.get(Calendar.YEAR);
           int month=rightNow.get(Calendar.MONTH)+1;
           int day=rightNow.get (Calendar.DAY_OF_MONTH);
           String da=year+"-"+month+"-"+day; 
           out.print("<span style='color:6C8ACC'>"+year+"-"+month+"-"+day+"     </span>"); 
           out.print("<a href='xinj.jsp?datt="+da+"' style='color:black;text-decoration:none'><img src='func_new.gif'>�½��ճ��¼�</a><br><br>");
           String sql="select * from oa_richeng where to_days(starttime)=to_days('"+da+"')";
           ResultSet rs=con.getRs(sql);
           while(rs.next()){
                int id=rs.getInt("id");
                String zhuti=rs.getString("zhuti");
                if(zhuti==null)
                    zhuti="";
               out.print("<a href='ric.jsp?id="+id+"' style='color:black'>"+zhuti+"</a><br><br>");
            }

     }   
%>

</body>
</html>
