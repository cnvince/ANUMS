<%@ page contentType="text/html; charset=gb2312" %>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%
 String driverName="com.mysql.jdbc.Driver";
 String userName="root";//���ݿ��û���
 String userPasswd="tmq";//����
 String dbName="friend";//���ݿ��� 
//�����ַ���
String url="jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPasswd;
Class.forName(driverName).newInstance();
Connection connection=DriverManager.getConnection(url);
Statement statement = connection.createStatement();
//ÿҳ��ʾ��¼��
int PageSize = 8;
int StartRow = 0; //��ʼ��ʾ��¼�ı�� 
int PageNo=0;//��Ҫ��ʾ��ҳ��
int CounterStart=0;//ÿҳҳ��ĳ�ʼֵ
int CounterEnd=0;//��ʾҳ������ֵ
int RecordCount=0;//�ܼ�¼��;
int MaxPage=0;//��ҳ��
int PrevStart=0;//ǰһҳ
int NextPage=0;//��һҳ
int LastRec=0; 
int LastStartRecord=0;//���һҳ��ʼ��ʾ��¼�ı�� 
//��ȡ��Ҫ��ʾ��ҳ�������û��ύ
if(request.getParameter("PageNo")==null){ //���Ϊ�գ����ʾ��1ҳ
  if(StartRow == 0){
     PageNo = StartRow + 1; //�趨Ϊ1
  }
}else{
  PageNo = Integer.parseInt(request.getParameter("PageNo")); //����û��ύ��ҳ��
  StartRow = (PageNo - 1) * PageSize; //��ÿ�ʼ��ʾ�ļ�¼���
}
//���ݵ�ǰ��ҳ����ʾһ��������ҳ������
//������ʾҳ��ĳ�ʼֵ!!
  if(PageNo % PageSize == 0){
   CounterStart = PageNo - (PageSize - 1);
  }else{
   CounterStart = PageNo - (PageNo % PageSize) + 1;
  }
CounterEnd = CounterStart + (PageSize - 1);
%>
<html>
<head>
<title>��ҳ��ʾ��¼</title>
<style type="text/css">
<!--
body {
	background-image: url(images/img.jpg);
}
-->
</style>
</head>
<%
//��ȡ�ܼ�¼��
ResultSet rs = statement.executeQuery("select count(*) from friends" ); 
rs.next(); 
RecordCount = rs.getInt(1);
rs = statement.executeQuery("SELECT id,name,tel FROM friends ORDER BY id DESC LIMIT "
       +StartRow+", "+PageSize);
//��ȡ��ҳ��
MaxPage = RecordCount % PageSize;
if(RecordCount % PageSize == 0){
  MaxPage = RecordCount / PageSize;
}else{
   MaxPage = RecordCount/PageSize+1;
}
%>
<body><center>
<p><b><%="��ҳ��ʾ��¼("+PageNo+"/"+MaxPage+")" %></b></p>
<br>
<table width="450" border="1">
  <tr> 
    <th>���</th>
    <th>����</th>
    <th >�绰</th>
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
  //��ʾ��һҳ����ǰһҳ������
  //�����ǰҳ���ǵ�1ҳ������ʾ��һҳ��ǰһҳ������
  if(PageNo != 1){
    PrevStart = PageNo - 1;
    out.print("<a href=db5.jsp?PageNo=1>��һҳ </a>: ");
    out.print("<a href=db5.jsp?PageNo="+PrevStart+">ǰһҳ</a>");
  }
  out.print("[");

   //��ӡ��Ҫ��ʾ��ҳ��
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

if(PageNo < MaxPage){ //�����ǰҳ�������һҳ������ʾ��һҳ����
    NextPage = PageNo + 1;
    out.print("<a href=db5.jsp?PageNo="+NextPage+">��һҳ</a>");
}

//ͬʱ�����ǰҳ�������һҳ��Ҫ��ʾ���һҳ������
if(PageNo < MaxPage){
   LastRec = RecordCount % PageSize;
   if(LastRec == 0){
      LastStartRecord = RecordCount - PageSize;
   }
   else{
      LastStartRecord = RecordCount - LastRec;
   }

   out.print(":");
    out.print("<a href=db5.jsp?PageNo="+MaxPage+">���һҳ</a>");
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

