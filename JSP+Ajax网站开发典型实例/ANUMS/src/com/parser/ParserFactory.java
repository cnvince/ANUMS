package com.parser;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CountDownLatch;

import javax.servlet.http.HttpServlet;

import org.w3c.dom.Document;

import com.util.XMLUtils;

public class ParserFactory extends HttpServlet{

	private String urlPath="/Users/user/git/honor_project/ANUMS/WebContent/WEB-INF/Classes/Resources/UrlMap.xml";
	
	private String query;
	//Document Collection to store the parsed documents
	private HashMap<Integer,Document> DocumentCollection;
	private HashMap<Integer,String> UrlCollection;
	public ParserFactory(String query) {
		// TODO Auto-generated constructor stub
		this.query=query;
		
		setDocumentCollection(new HashMap<Integer,Document>());
	}
	private void initialUrlCollection()
	{
		UrlCollection=XMLUtils.ParseToHashMap(urlPath, query);
	}
	public void initialDocuments()
	{
		long start=System.currentTimeMillis();
		this.initialUrlCollection();
		CountDownLatch countDownLatch = new CountDownLatch(UrlCollection.size());
		for(Map.Entry<Integer, String> entry:UrlCollection.entrySet())
		{
			String url=entry.getValue();
			Document document=null;
			Thread t=new Thread(new Parser(countDownLatch,url,DocumentCollection,entry.getKey()));
			t.start();
		}
		try {
			countDownLatch.await();
			long end=System.currentTimeMillis();
			System.out.println("TotalTime:"+(end-start)/1000+"s");
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		long start=System.currentTimeMillis();
		ParserFactory factory=new ParserFactory("Paul");
		factory.initialDocuments();
		long end=System.currentTimeMillis();
		System.out.println("TotalTime:"+(end-start)/1000+"s");
	}
	public HashMap<Integer,Document> getDocumentCollection() {
		return DocumentCollection;
	}
	public void setDocumentCollection(HashMap<Integer,Document> documentCollection) {
		DocumentCollection = documentCollection;
	}

}
