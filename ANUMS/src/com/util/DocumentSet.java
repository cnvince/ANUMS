package com.util;
//maintain a document set to check if the document is already existed;
import java.util.HashSet;

public class DocumentSet {
	
	public static HashSet<String> documents=new HashSet<String>();
	public DocumentSet() {
		// TODO Auto-generated constructor stub
	}
	public static void AddDocument(String url)
	{
		documents.add(url);
	}
//	duplication detection
	public static boolean contains(String url)
	{
		if(documents.contains(url))
		{
			System.out.println("url:"+url+"duplicated");
			return true;
		}
		return false;
	}
	public static void reset()
	{
		documents=new HashSet<String>();
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
