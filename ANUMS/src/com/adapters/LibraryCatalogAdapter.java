package com.adapters;

import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.datatype.ServerSource;
import com.interfaces.Adapter;
import com.resultpool.RankList;
import com.resultpool.ResultTable;
import com.resultpool.Server;
import com.results.LibcataResult;
import com.util.Parser;
import com.util.StringFormat;



public class LibraryCatalogAdapter implements Adapter {

	Thread t;
	public String queryTerm;
	public final int source = ServerSource.LIBRARY;
	public static String hostUrl = "http://library.anu.edu.au";
	public String redirectUrl = "http://library.anu.edu.au/search/Y?SEARCH=";
	public Document document;
	public XPath xpath;
	public ResultTable results;
	public HashMap<Integer,Server> sTable=new HashMap<Integer,Server>();
	public LibraryCatalogAdapter(String query,ResultTable results, HashMap<Integer,Server> serverTable) {
		// TODO Auto-generated constructor stub
		queryTerm = StringFormat.toURL(query);
		redirectUrl = redirectUrl + queryTerm;
			document = Parser.parse(redirectUrl);
		this.results=results;
		this.sTable=serverTable;
		xpath = XPathFactory.newInstance().newXPath();
		t = new Thread(this, "Library Adapter");
	}

	@Override
	public RankList query(String query) {
		// TODO Auto-generated method stub
		if(document==null)
			return null;
		Pattern pattern=Pattern.compile("\\d+\\s+(results|result) found");
		Node body;
		Matcher matcher = null;
		try {
			body = (Node) xpath
					.evaluate("//BODY", document,
							XPathConstants.NODE);
			matcher=pattern.matcher(body.getTextContent());
		} catch (XPathExpressionException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		int size=0;
		while(matcher.find())
		{
			String match=matcher.group();
			size=Integer.parseInt(match.substring(0, match.indexOf("result")).trim());
			System.out.println("size:"+size);
		}
		Server server=new Server();
		server.setServer(source);
		server.setResult_size(size);
		sTable.put(source, server);
		RankList ranklist = new RankList();
		try {
			NodeList nodeList = (NodeList) xpath.evaluate(
					"//TD[@class=\"briefCitRow\"]", document,
					XPathConstants.NODESET);
			int length = nodeList.getLength();
			for (int i = 0; i < length; i++) {
				Element ROW = (Element) nodeList.item(i);
				LibcataResult result = new LibcataResult();
				// System.out.println("=================================================");
				Node Title = (Node) xpath.evaluate(
						"TABLE//SPAN[@class=\"briefcitTitle\"]/A", ROW,
						XPathConstants.NODE);
				String title = Title.getTextContent().trim();
				result.setTitle(title);
				String Link = hostUrl
						+ ((Element) Title).getAttribute("href").trim();
				result.setLink(Link);
				Node Summary = (Node) xpath.evaluate(
						"TABLE//SPAN[@class=\"briefcitTitle\"]", ROW,
						XPathConstants.NODE);
				String textarea = Summary.getTextContent().trim();
				String summary = textarea.substring(title.length() + 1).trim();
				result.setSummary(summary);
				result.setSource(source);
				result.setDsumary();
				ranklist.addResult(result);
			}

		} catch (XPathExpressionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ranklist;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {

	}

	public void display() {
		System.out.println(this.source + "created...");
		for (int i = 0; i < 10; i++)
			System.out.println(this.source + ":" + i);
	}

	@Override
	public void run() {
		results.AddRankList(source, query(queryTerm));
	}

}
