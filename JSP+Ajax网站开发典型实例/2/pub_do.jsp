<%@ page language="java" import="java.io.*,java.sql.*" pageEncoding="gb2312"%>
<%
  String title=request.getParameter("title");
  title=new String(title.getBytes("ISO-8859-1"));
  String content=request.getParameter("content");
  content=new String(content.getBytes("ISO-8859-1"));
  java.util.Date date=new java.util.Date();
  String str="news"+date.getYear()+date.getMonth()+date.getDay()+
  date.getHours()+date.getMinutes()+date.getSeconds();
  File file=new File("C:\\Tomcat\\webapps\\JSP_DB\\news",str+".htm");
  try{
    createFile(title,content,file);
    String fileName=file.getName();
    insertSQL(title,fileName);
    response.sendRedirect("news/"+fileName);
  }catch(Exception e){
    out.print(e.toString());  
  }
%>
<%!
  //根据提交的内容创建html文件
  private void createFile(String title,String content,File file)throws IOException,SQLException{
    
    if(!file.exists()){
       file.createNewFile();
    }
    PrintWriter pw = new PrintWriter(new FileOutputStream(file)); 
    pw.println("<title>"+title+"</title>");
    pw.println(content); 
    pw.close(); 
    
    
  }
%>
<%!
  //对应的把新闻标题与文件名写入数据库
  private void insertSQL(String title,String fileName)throws SQLException{
    String sql="insert into news values('"+title+"','"+fileName+"')";
    Statement st=getStatement();
    st.executeUpdate(sql);
    st.close();
  }
%>
<%!
  //获得Statement对象
  private Statement getStatement()throws SQLException{
    try{
     Class.forName("com.mysql.jdbc.Driver");
    }catch(Exception e){}
	 String url="jdbc:MySQL://localhost:3306/new?user=root&password=tmq&characterEncoding=gb2312";
	 Connection con=DriverManager.getConnection(url);
	 return con.createStatement();
  }
 %>

