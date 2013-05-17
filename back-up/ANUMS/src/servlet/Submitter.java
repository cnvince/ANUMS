package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Submitter extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// reading the user input
	    PrintWriter out = resp.getWriter();
	    out.println (
	      "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\""+
	      "http://www.w3.org/TR/html4/loose.dtd\">\n" +
	      "<html> \n" +
	        "<head> \n" +
	          "<meta http-equiv=\"Content-Type\" content=\"text/html;charset=ISO-8859-1\"> \n" +
	          "<title> My first jsp  </title> \n" +
	        "</head> \n" +
	        "<body> \n" +
	          "<font size=\"12px\" color=\""  + "\">" +
	            "Hello World" +
	          "</font> \n" +
	        "</body> \n" +
	      "</html>" 
	    );  
	  }  

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Submitter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
