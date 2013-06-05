package com.google.rels.server;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

public class DocumentInitial extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String folder="/Queries/";
		String fileName = folder+"queries.txt";
		ServletContext context = getServletContext();
		InputStream ins = context.getResourceAsStream(fileName);
		//read from file
		BufferedReader reader = new BufferedReader(new InputStreamReader(ins));
        String cquery;

        while((cquery = reader.readLine())!= null){
            String query=cquery.trim();
            String filename=folder+query+".txt";
            ins=context.getResourceAsStream(filename);
            BufferedReader dreader = new BufferedReader(new InputStreamReader(ins));
            String result;
            while((result = dreader.readLine())!= null){
            	String Title=result.substring(0, result.indexOf("[Link]"));
            	String Link=result.substring(result.indexOf("[Link]")+6,result.indexOf("[Source]"));
              	String Source=result.substring(result.indexOf("[Source]")+8);
                Entity document = new Entity("Document");
                document.setProperty("Query",query);
                document.setProperty("Title", Title);
                document.setProperty("Link", Link);
                document.setProperty("Source",Source);
                DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
                datastore.put(document);
            }
        }
	}

	public DocumentInitial() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
