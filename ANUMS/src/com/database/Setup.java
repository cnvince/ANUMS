package com.database;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import twitter4j.internal.logging.Logger;

import com.broker.Controller;
import com.datatype.ALGORITHM;
import com.results.Result;

public class Setup {

	public Setup() {
		// TODO Auto-generated constructor stub
	}
	public void setupdb()
	{
		Datasource ds=new Datasource();
		ds.reset();
	}
	public void setupdocs()
	{
		String fileName = "Queries/queries.txt";
		//read from file
		BufferedReader reader;
		try {
			reader = new BufferedReader(new FileReader(fileName));
			 String cquery;

		        while((cquery = reader.readLine())!= null){
		            String query=cquery.trim();
					ArrayList<Result> results = new ArrayList<Result>();
					Controller controller = new Controller();
					results = controller.fetchResult(query, ALGORITHM.JUDGE);
					Connector.Connect();
					Connection conn=Connector.getConnection();
					String Sql_query="INSERT INTO QUERIES (Q_TERM,ASSESSED) VALUES (? ,0)";
					PreparedStatement statement=null;
					try {
						statement=conn.prepareStatement(Sql_query);
						statement.setString(1, query);
						statement.executeUpdate();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						System.err.println(e.getMessage());
						Logger logr=Logger.getLogger(this.getClass());
						logr.info(e.getMessage());
					}
					
					for (Result result : results) {
						String Sql_docs="INSERT INTO QUERY_DOCUMENT (Q_TERM, TITLE,LINK,SOURCE) VALUES (?,?,?,?)";
						try {
							statement = conn.prepareStatement(Sql_docs);
							statement.setString(1, query);
							String title=result.getTitle();
							if(title.length()>50)
								title=title.substring(0,50);
							statement.setString(2, title);
							statement.setString(3, result.getLink());
							statement.setString(4, result.getSourceName());
							statement.executeUpdate();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					try {
						statement.close();
					} catch (SQLException e) {
						System.err.println(e.getMessage());
						Logger logr=Logger.getLogger(this.getClass());
						logr.info(e.getMessage());
					}
		           
		        }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Setup setup=new Setup();
		setup.setupdb();
		setup.setupdocs();
			
	}

}
