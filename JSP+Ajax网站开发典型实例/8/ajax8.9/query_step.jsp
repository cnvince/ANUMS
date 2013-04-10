<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java"%>
<%@ page import="java.sql.*,com.DBpool"%>
<%!//从数据库查询问题信息
    String getQuery(String name) {
        StringBuffer queryInfo = new StringBuffer("{");         //用于保存问题信息
        String sql = "select * from query_step where name = ?"; //定义查询数据库的SQL语句
        Connection conn = null;                 //声明Connection对象
        PreparedStatement pstmt = null;         //声明PreparedStatement对象
        ResultSet rs = null;                    //声明ResultSet对象
        try {
            conn = com.DBpool.getConnection();   //获取数据库连接
            pstmt = conn.prepareStatement(sql); //根据sql创建PreparedStatement
            pstmt.setString(1, name);           //设置参数
            rs = pstmt.executeQuery();          //执行查询，返回结果集
            if (rs.next()) {//加入各名值对信息
                queryInfo.append("'name':'");
                queryInfo.append(rs.getString("name"));
                queryInfo.append("','type':'");
                queryInfo.append(rs.getString("type"));
                queryInfo.append("','info':'");
                queryInfo.append(rs.getString("info"));
                queryInfo.append("','last':'");
                queryInfo.append(rs.getString("islast"));
                String items = rs.getString("items");
                //当items选项有具体内容时加入items名值对
                if (items != null && !"".equals(items)) {
                    queryInfo.append("','items':");
                    queryInfo.append(rs.getString("items"));
                } else {
                    queryInfo.append("'");
                }
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally 
        {
            	try
				{
					rs.close();
					pstmt.close();
					conn.close();	
				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}       //关闭连接
        }
        queryInfo.append("}");
        return queryInfo.toString();
    }
%><%
    out.clear();     //清空当前的输出内容（空格和换行符）
	request.setCharacterEncoding("utf-8");
    String queryParam = request.getParameter("queryParam"); //获取queryParam参数
    String paramValue = request.getParameter("paramValue"); //获取参数值
    //根据用户输入信息决定下一个显示的问题
    if ("0".equals(queryParam)) 
        out.print(getQuery("queryWay"));
    else if ("queryWay".equals(queryParam)) 
    {
        if ("quick".equals(paramValue)) 
            out.print(getQuery("keyword"));
        else if ("detail".equals(paramValue))
            out.print(getQuery("productType"));
    } 
    else if ("productType".equals(queryParam)) 
        out.print(getQuery("keyword"));
%>