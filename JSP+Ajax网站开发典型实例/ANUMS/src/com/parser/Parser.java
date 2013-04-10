package com.parser;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.concurrent.CountDownLatch;

import org.cyberneko.html.parsers.DOMParser;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;
import org.xml.sax.SAXNotRecognizedException;
import org.xml.sax.SAXNotSupportedException;

public class Parser implements Runnable {
	private CountDownLatch countDownLatch;
	public String urlstr;
	public HashMap<Integer, Document> documentCollection;
	public int server;

	public Parser(CountDownLatch countDownLatch, String url,
			HashMap<Integer, Document> documentCollection, int server) {
		this.urlstr = url;
		this.countDownLatch = countDownLatch;
		this.documentCollection = documentCollection;
		this.server = server;
		// TODO Auto-generated constructor stub
	}

	public void parse() {
		System.out.println("start parsing:" + this.urlstr);
		Document document = null;
		long start = System.currentTimeMillis();
		DOMParser parser = new DOMParser();
		try {
			parser.setFeature("http://xml.org/sax/features/namespaces", false);
			// long start1=System.currentTimeMillis();
			InputStream byteStream = com.util.InputStreamLoader
					.OpenStream(urlstr);
			// long end1=System.currentTimeMillis();
			// System.out.println("reading time:"+(end1-start1)/1000+"s");
			parser.parse(new org.xml.sax.InputSource(byteStream));
			document = parser.getDocument();
		} catch (SAXNotRecognizedException | SAXNotSupportedException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			System.err.println(e.getMessage());
			System.err.println(urlstr + " skipped");
		} // IMPORTANT!!
		catch (SAXException e) {
			System.err.println(e.getMessage());
			System.err.println(urlstr + " skipped");
		} catch (IOException e) {
			System.err.println(e.getMessage());
			System.err.println(urlstr + " skipped");
		}

		long end = System.currentTimeMillis();
		System.out.println(urlstr + ":" + (end - start) / 1000 + "s");
		documentCollection.put(server, document);
		countDownLatch.countDown();
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// Parser.parse("http://www.anu.edu.au/dirs/search.php?stype=Staff+Directory&querytext=david");

	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		this.parse();
	}

}
