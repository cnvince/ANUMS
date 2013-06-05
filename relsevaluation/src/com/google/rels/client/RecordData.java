package com.google.rels.client;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

public class RecordData extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String[] url=request.getParameterValues("url");
		String[] relevance=request.getParameterValues("relevance");
		if(url!=null&&relevance!=null)
		{
			String query=(String) session.getAttribute("query")	;
 			for(int i=0;i<url.length;i++)
			{
 				Entity result = new Entity(query);
 		        result.setProperty("Document", url[i]);
 		        Date date=new Date();
 		        result.setProperty("Score",relevance[i]);
				result.setProperty("date", date);
 		        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
 		        datastore.put(result);
			}
		}
		if(request.getParameter("index").trim().equals(session.getAttribute("querySize").toString()))
		{
			RequestDispatcher rd = request.getRequestDispatcher("/Thank.jsp");
			rd.forward(request, response);
		}
		else
		{
		request.setAttribute("index", request.getParameter("nextIndex"));
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
		rd.forward(request, response);
		}
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = -1512102120789473328L;

	public RecordData() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
