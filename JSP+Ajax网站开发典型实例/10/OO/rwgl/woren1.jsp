<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%
try
 {
String name=(String)session.getAttribute("name");
String wangc1=request.getParameter("wangc");
String sql="";
if(wangc1.equals("0"))
  sql="select * from renwu where wangc='0'";
if(wangc1.equals("1"))
  sql="select * from renwu where wangc='1'";
ResultSet rs=con.executeQuery(sql);
int intPageSize;      //һҳ��ʾ�ļ�¼��
int intRowCount;      //��¼������
int intPageCount;     //��ҳ��
int intPage;         //����ʾ��ҳ��
String strPage;
int i;
//����һҳ��ʾ�ļ�¼��
intPageSize=3;
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
//����������ʾ����
i=0;
  StringBuffer content=new StringBuffer(""); 
  response.setContentType("text/xml"); 
  response.setHeader("Cache-Control","no-cache");
  content.append("<?xml version=\"1.0\"   encoding=\"UTF-8\" ?>");
  content.append("<contents>");
while(i<intPageSize && !rs.isAfterLast())
{
     String id=rs.getString("id");
     String zhuti=rs.getString("zhuti");
     String zhongy=rs.getString("zhongy");
     String jinj=rs.getString("jinj");
     String jind=rs.getString("jind");
     String xiat=rs.getString("xiat");
     String want=rs.getString("want");
     String zhix=rs.getString("zhix");
     String[] s1= zhix.split("/");
     if(s1[0].equals(name)){
        content.append("<content>");
        content.append("<id>"+id+"</id>");
        content.append("<zhuti>"+zhuti+"</zhuti>");
        content.append("<zhongy>"+zhongy+"</zhongy>");
        content.append("<jinj>"+jinj+"</jinj>");
        content.append("<jind>"+ jind +"</jind>");
        content.append("<xiaf>"+ xiat +"</xiaf>");
        content.append("<wangc>"+want +"</wangc>");
        content.append("<zhix>"+zhix +"</zhix>");
        content.append("</content>");}
     else{
         content.append("<content>");
        content.append("<id>&nbsp;&nbsp; </id>");
        content.append("<zhuti>&nbsp;&nbsp; </zhuti>");
        content.append("<zhongy>&nbsp;&nbsp;</zhongy>");
        content.append("<jinj>&nbsp;&nbsp;</jinj>");
        content.append("<jind>&nbsp;&nbsp;</jind>");
        content.append("<xiaf>&nbsp;&nbsp;</xiaf>");
        content.append("<wangc>&nbsp;&nbsp;</wangc>");
        content.append("<zhix>&nbsp;&nbsp;</zhix>");
        content.append("</content>");
        }
    
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




