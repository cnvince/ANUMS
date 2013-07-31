package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.assess.sql.Connector;

/**
 * Servlet implementation class NextQuery
 */
public class NextQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NextQuery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				HttpSession session = request.getSession();
				String query = session.getAttribute("query").toString();
				Connector.Connect();
				Connection conn=Connector.getConnection();
//				set query to assessed
				String sql_update="UPDATE QUERIES SET ASSESSED=1 WHERE Q_TERM=?;";
				try {
					PreparedStatement statement=conn.prepareStatement(sql_update);
					statement.setString(1, query);
					int num=statement.executeUpdate();
					if(num>0)
					{
						response.sendRedirect("assess.jsp");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Connector.DisConnect();
	}

}
