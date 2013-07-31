package com.execution;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;


import com.assess.sql.Connector;
import com.assess.sql.Datasource;

public class initial {

	public initial() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		Datasource datasource = new Datasource();
		datasource.reset();
		Connector.Connect();
		Connection conn = Connector.getConnection();
		String queryPath = "Queries/queries.txt";
		FileReader file = null;
		try {
			file = new FileReader(queryPath);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// intial the queries table
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (file != null) {
			BufferedReader reader = new BufferedReader(file);
			String text = "";
			//
			// We read the file line by line
			try {
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
					String documentPath = "Documents/" + text.trim() + ".txt";
					BufferedReader dreader = new BufferedReader(new FileReader(
							documentPath));
					String document = "";
					// Connector.Connect();
					// conn=Connector.getConnection();
					while ((document = dreader.readLine()) != null) {
						System.out.println(document);
						String Title = document.substring(
								document.indexOf("[Title]") + 7,
								document.indexOf("[Link]"));
						if (Title.length() > 100)
							Title = Title.substring(0, 50);
						System.out.println("Title:" + Title);
						String Link = document.substring(
								document.indexOf("[Link]") + 6,
								document.indexOf("[Source]"));
						String Source = document.substring(document
								.indexOf("[Source]") + 8);
						String sql_d_insert = "INSERT INTO QUERY_DOCUMENT (Q_TERM, TITLE,LINK,SOURCE) VALUES (?,?,?,?)";
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
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		Connector.DisConnect();

	}

}
