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


/**
 * @Author PengFei Li Parser class to parse returned result page
 * 
 */
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
			InputStream byteStream =WebReader.OpenStream(urlstr);
			if(byteStream!=null)
			{
				parser.parse(new org.xml.sax.InputSource(byteStream));
				document=parser.getDocument();
			}
		} catch (SAXNotRecognizedException | SAXNotSupportedException e) {
			// TODO Auto-generated catch block
//			 e.printStackTrace();
			System.err.println(e.getMessage());
			System.err.println(urlstr + " skipped");
		} // IMPORTANT!!
		catch (SAXException e) {
			e.printStackTrace();
			System.err.println(e.getMessage());
			System.err.println(urlstr + " skipped");
		} catch (IOException e) {
			e.printStackTrace();
			System.err.println(e.getMessage());
			System.err.println(urlstr + " skipped");
		}
		long end = System.currentTimeMillis();
		System.out.println("server:"+server+"  "+urlstr + ":" + (end - start) / 1000 + "s");
		if(document!=null)
			documentCollection.put(server, document);
		countDownLatch.countDown();
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Parser parser = new Parser(null,
				"https://studyat.anu.edu.au/search?search_terms=TEST", null, 0);
		parser.parse();

	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		this.parse();
	}

}
