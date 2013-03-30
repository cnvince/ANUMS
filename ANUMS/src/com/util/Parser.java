package com.util;

import java.io.IOException;
import java.io.InputStream;


import org.cyberneko.html.parsers.DOMParser;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;
import org.xml.sax.SAXNotRecognizedException;
import org.xml.sax.SAXNotSupportedException;

public class Parser {

	public Parser(String url) {
		// TODO Auto-generated constructor stub
	}

	public static Document parse(String urlstr){
			long start=System.currentTimeMillis();
			Document document=null;
		   DOMParser parser = new DOMParser();
	        try {
				parser.setFeature("http://xml.org/sax/features/namespaces", false);
				 InputStream byteStream = com.util.InputStreamLoader.OpenStream(urlstr);
			        parser.parse(new org.xml.sax.InputSource(byteStream));
			        document = parser.getDocument();
	        } catch (SAXNotRecognizedException | SAXNotSupportedException e) {
				// TODO Auto-generated catch block
//				e.printStackTrace();
	        	System.err.println(e.getMessage());
	        	System.err.println(urlstr+" skipped");
			} // IMPORTANT!!
		catch (SAXException e) {
			System.err.println(e.getMessage());
        	System.err.println(urlstr+" skipped");
			} catch (IOException e) {
				System.err.println(e.getMessage());
	        	System.err.println(urlstr+" skipped");
			}
	       
	        long end=System.currentTimeMillis();
	        System.out.println(urlstr+":"+(end-start)/1000+"s");
		return document;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Parser.parse("http://www.anu.edu.au/dirs/search.php?stype=Staff+Directory&querytext=david");
	}

}
