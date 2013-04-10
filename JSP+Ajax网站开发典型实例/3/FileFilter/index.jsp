<%@ page language="java" import="java.util.*,com.FileFilterBean" pageEncoding="utf-8"%>
<html>
<body>
 <%
  String file="";
  String filter=""; 
  request.setCharacterEncoding("utf-8");
 if(request.getParameter("file")!=null)
 {
 	file=request.getParameter("file");       //获得文件夹路径
    filter=request.getParameter("filter");  //获得文件扩展名   
 }
 %>
  <form action="index.jsp" method="post">
    <table align="center" width="70%" border="0">
    <tr>
	<td width="62%" align="center"><div align="left">文件夹:
	  <input name="file" type="text" value="<%=file %>" size="30">
	  </div></td>
	  </tr><tr>
	<td width="29%" align="center"><div align="left">文件扩展名:
	  <select name="filter">
	    <option value="exe" <% if(filter.equals("exe")) out.print("selected"); %>>*.exe</option>
	    <option value="txt" <% if(filter.equals("txt")) out.print("selected"); %>>*.txt</option>
	    <option value="jpg" <% if(filter.equals("jpg")) out.print("selected"); %>>*.jpg</option>
	    <option value="mp3" <% if(filter.equals("mp3")) out.print("selected"); %>>*.mp3</option>
	    </select>&nbsp;&nbsp;<input type="submit" value="显示">
	  </div></td>
	</tr>
    </table>
  </form>
    <table align="center" width="70%" border="0">
    <tr><td>    
 <%
 if(request.getParameter("file")!=null)
 {
 	FileFilterBean ffb=new FileFilterBean();
 	Vector v=new Vector();
 	v=ffb.show(file,filter);              
 	for(int j=0;j<v.size();j++)
 	{
 		out.println(v.get(j).toString()+"&nbsp;&nbsp;&nbsp;");
 	} 
 }
  %> 
  </td></tr>
  </table>
  </body>
</html>
