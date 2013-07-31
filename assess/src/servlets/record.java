package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.assess.sql.Connector;

/**
 * Servlet implementation class record
 */
@WebServlet("/record")
public class record extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public record() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userid = session.getAttribute("user").toString();
		String query = session.getAttribute("query").toString();
		String link = request.getParameter("link");
		String scoreStr = request.getParameter("score");
		int score = Integer.parseInt(scoreStr);
		Connector.Connect();
		Connection conn = Connector.getConnection();
		try {
			String sql_update = "UPDATE RESULT SET SCORE=?, RDATE=? WHERE Q_TERM=? AND LINK=? AND USERID=?;";
			PreparedStatement statement = conn.prepareStatement(sql_update);
			System.out.println(userid);
			statement.setInt(1, score);
			Calendar currenttime = Calendar.getInstance();
			Date sqldate = new Date((currenttime.getTime()).getTime());
			statement.setDate(2, sqldate);
			statement.setString(3, query);
			System.out.println("query"+query);
			statement.setString(4, link);
			System.out.println("link:"+link);
			statement.setString(5, userid);
			int num=statement.executeUpdate();
			System.out.println("affected row:"+num);
			statement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
