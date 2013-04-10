package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchSuggest extends HttpServlet 
{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException 
	{
		String search = request.getParameter("search"); //接受参数值
		String sql = "select title from suggest where title like '"+search+"%' order by title";//设置查询语句
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector vData = new Vector();
		java.io.PrintWriter out = response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver"); //注册数据库连接驱动
			String url = "jdbc:mysql://localhost/jspajax";
			conn = DriverManager.getConnection(url, "root", "19841025");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql); //执行查询
			while (rs.next())
			{
				vData.add(rs.getString("TITLE"));
			}
			StringBuffer buf = new StringBuffer();
			for (int i=0;i<vData.size();i++)
			{
				String keyword = (String)vData.get(i);
				buf.append(keyword+"\n");
			}
			out.print(buf.toString());//向客户端输出信息
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException sqle) {
			}
		}
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException 
	{
		doPost(request, response);
	}
}