<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="test.Conn" scope="page"></jsp:useBean>
<%
  try{
  String id=request.getParameter("id");
  int num=Integer.parseInt(id);
  String sql="select * from renwu where id="+num;

  StringBuffer content=new StringBuffer(""); 
  response.setContentType("text/xml"); 
  response.setHeader("Cache-Control","no-cache");
  content.append("<?xml version=\"1.0\"   encoding=\"UTF-8\" ?>");
  content.append("<contents>");

  ResultSet rs=con.getRs(sql);
  while(rs.next()){
     String zhuti=rs.getString("zhuti");
     String zhongy=rs.getString("zhongy");
     String jinj=rs.getString("jinj");
     String jind=rs.getString("jind");
     String xiaf=rs.getString("xiaf");
     String zhix=rs.getString("zhix");
     String cany=rs.getString("cany");
     String xiat=rs.getString("xiat");
     String want=rs.getString("want");
     String content1=rs.getString("content");
     String fj=rs.getString("fj");
     String guanl=rs.getString("guanl");

     content.append("<content>");
     content.append("<zhuti>"+zhuti+"</zhuti>");
     content.append("<zhongy>"+zhongy+"</zhongy>");
     content.append("<jinj>"+jinj+"</jinj>");
     content.append("<jind>"+ jind +"</jind>");
     content.append("<xiaf>"+xiaf +"</xiaf>");
     content.append("<zhix>"+zhix +"</zhix>");
     content.append("<cany>"+cany+"</cany>");
     content.append("<xiat>"+ xiat +"</xiat>");
     content.append("<want>"+want +"</want>");
     content.append("<content1>"+content1 +"</content1>");
     content.append("<fj>"+fj+"</fj>");
     content.append("<guanl>"+guanl+"</guanl>");
     content.append("</content>");
     }
   content.append("</contents>");
   out.print(content);
  }
 catch(Exception e){
      e.printStackTrace();
   }
%>
