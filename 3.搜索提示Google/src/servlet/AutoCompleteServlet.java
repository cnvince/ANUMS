package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;

public class AutoCompleteServlet extends HttpServlet {

    private List names = new ArrayList();

    //Initialize global variables
    public void init() throws ServletException {
        names = this.getProducts();
    }

    //Process the HTTP Get request
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String prefix = request.getParameter("names");
        List matching = findNames(prefix);
        if (matching.size() > 0){
            PrintWriter out = response.getWriter();

            response.setContentType("text/xml");
            response.setHeader("Cache-Control","no-cache");

            out.println("<response>");
            Iterator iter = matching.iterator();
            while(iter.hasNext()){
                String name = (String)iter.next();
                out.println("<name>" + name + "</name>");
            }
            out.println("</response>");
            matching = null;
            out.close();
        }else{
            response.setStatus(HttpServletResponse.SC_NO_CONTENT);
        }

    }

    public List findNames(String prefix){
        String prefix_upper = prefix.toUpperCase();
        List matches = new ArrayList();
        Iterator iter = names.iterator();
        while(iter.hasNext()){
            String name = (String)iter.next();
            String name_upper = name.toUpperCase();
            if (name_upper.startsWith(prefix_upper)){
                matches.add(name);
            }
        }
        return matches;
    }

    public static List getProducts() {
      List list = new ArrayList();
      Connection con = null;
      Statement stmt = null;
      ResultSet rs = null;
      String sql = "select * from Products";
      try {
        con = ConnectionManager.getConnection();
        stmt = con.createStatement();
        rs = stmt.executeQuery(sql);
        while(rs.next()){
          list.add(rs.getString(2));
        }
      }
      catch (Exception e) {
        e.printStackTrace();
      }
      finally {
        ConnectionManager.close(rs);
        ConnectionManager.close(stmt);
        ConnectionManager.close(con);
      }
      return list;
  }


    //Process the HTTP Post request
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }

    //Clean up resources
    public void destroy() {
    }
}
