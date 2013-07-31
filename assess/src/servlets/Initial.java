package servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.assess.sql.Connector;
import com.assess.sql.Datasource;

/**
 * Servlet implementation class Initial
 */
public class Initial extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Initial() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// get connected
		Connector.Connect();
		Connection con = Connector.getConnection();
		Statement stmt;
		try {
			stmt = con.createStatement();
			stmt.executeUpdate("CREATE DATABASE books");
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Datasource datasource = new Datasource();
		datasource.reset();
		Connector.Connect();
		Connection conn = Connector.getConnection();
		String queryPath = "/Queries/query.txt";
		ServletContext context = getServletContext();
		InputStream is = context.getResourceAsStream(queryPath);
		// intial the queries table
			Statement stmt=null;
			try {
				stmt = conn.createStatement();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (is != null) {
				InputStreamReader isr = new InputStreamReader(is);
				BufferedReader reader = new BufferedReader(isr);
				String text = "";
				//
				// We read the file line by line 
				while ((text = reader.readLine()) != null) {
					String sql_q_insert = "INSERT INTO QUERIES (Q_TERM,ASSESSED) VALUES ('"
							+ text.trim() + "',0)";
					System.out.println(sql_q_insert);
					try {
						stmt.execute(sql_q_insert);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					String documentPath = "/documents/"+text.trim()+".txt";
					InputStream dis = context.getResourceAsStream(documentPath);
					InputStreamReader disr = new InputStreamReader(dis);
					BufferedReader dreader = new BufferedReader(disr);
					String document="";
//					Connector.Connect();
//					conn=Connector.getConnection();
					while((document = dreader.readLine()) != null)
					{
						System.out.println(document);
						String Title=document.substring(document.indexOf("[Title]")+7,document.indexOf("[Link]"));
						if(Title.length()>100)
							Title=Title.substring(0, 50);
						System.out.println("Title:"+Title);
						String Link=document.substring(document.indexOf("[Link]")+6,document.indexOf("[Source]"));
						String Source=document.substring(document.indexOf("[Source]")+8);
						String sql_d_insert="INSERT INTO QUERY_DOCUMENT (Q_TERM, TITLE,LINK,SOURCE) VALUES (?,?,?,?)";
						PreparedStatement statement;
						try {
							statement = conn.prepareStatement(sql_d_insert);
							statement.setString(1, text.trim());
							statement.setString(2, Title);
							statement.setString(3, Link);
							statement.setString(4, Source);
							statement.executeUpdate();
							statement.close();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
			}
		Connector.DisConnect();
	}

}
