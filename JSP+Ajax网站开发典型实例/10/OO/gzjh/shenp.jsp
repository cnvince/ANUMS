<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%
  String sessionname=(String)session.getAttribute("name");
  String sqq="select gangw from oa_user where zhangh='"+sessionname+"'";
  ResultSet rss=con.getRs(sqq);
  rss.next();
  String gangw=rss.getString("gangw");
  if(gangw.equals("�ܾ���") | gangw.equals("���ܾ���") | gangw.equals("����") | gangw.equals("����")){
%>
<h3 align="center">�������ƻ�</h3>
<table  width=95% style="font-size:12" align="center">
<th bgcolor="D0DCED">����</th><th bgcolor="D0DCED">���</th><th bgcolor="D0DCED">����</th><th bgcolor="D0DCED">ʱ��</th>
<th bgcolor="D0DCED">����ʱ��</th><th bgcolor="D0DCED">����</th><th bgcolor="D0DCED">��������</th><th bgcolor="D0DCED">�ƶ���</th><th bgcolor="D0DCED">��������</th><th bgcolor="D0DCED">����</th>
<%
String sql="select * from oa_jihua where sp='0'";
ResultSet rs=con.executeQuery(sql);
int intPageSize;      //һҳ��ʾ�ļ�¼��
int intRowCount;      //��¼������
int intPageCount;     //��ҳ��
int intPage;         //����ʾ��ҳ��
String strPage;
int i;
//����һҳ��ʾ�ļ�¼��
intPageSize=6;
//ȡ�ô���ʾ��ҳ��
strPage=request.getParameter("page");
//�ж�strPage�Ƿ����null,����ǣ���ʾ��һҳ����
if(strPage==null)
{
intPage=1;
}else{
//���ַ���ת��Ϊ����
intPage=java.lang.Integer.parseInt(strPage);
}
if(intPage<1)
{
intPage=1;
}
//��ȡ��¼����
rs.last();
intRowCount=rs.getRow();
//�������ҳ��
intPageCount=(intRowCount+intPageSize-1)/intPageSize;
//��������ʾ��ҳ��
if(intPage>intPageCount) intPage=intPageCount;
if(intPageCount>0)
{
//����¼ָ�붨λ������ʾҳ�ĵ�һ����¼��
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
   out.print("<tr><td bgcolor='E4EAF4'>"+mc+"</td><td bgcolor='E4EAF4'>"+leib+"</td><td bgcolor='E4EAF4'>"+jibie+"</td><td bgcolor='E4EAF4'>"+shij+"</td><td bgcolor='E4EAF4'>"+shit+"</td><td bgcolor='E4EAF4'>"+content+"</td><td bgcolor='E4EAF4'>"+gl+"</td><td bgcolor='E4EAF4'>"+jhr+"</td><td bgcolor='E4EAF4'>"+bum+"</td><td bgcolor='E4EAF4'><a href='../shenp1?id="+id+"' style='color:04329C'>ͨ��</a></td></tr>");
 rs.next();
 i++;
 }

%>
 <%
 out.print("</table>");
 //�ر����ӡ��ͷ���Դ
 rs.close();
 %>
��<%=intRowCount%>����¼����<%=intPageCount%>ҳ��ʾ����ǰҳ�ǣ���<%=intPage%>ҳ
<%
for(int j=1;j<=intPageCount;j++)
{
out.print("&nbsp;&nbsp;<a href='shenp.jsp?page="+j+"' style='color:04329C'>"+j+"</a>");
}
%>
</div>
<%}else{%>
<p>�㲻��������Ȩ��</p>
<%}%>
