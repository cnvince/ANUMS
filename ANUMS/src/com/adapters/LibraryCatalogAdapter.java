package com.adapters;

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
import com.results.LibcataResult;
import com.util.Parser;
import com.util.StringFormat;



public class LibraryCatalogAdapter implements Adapter {

	Thread t;
	public String queryTerm;
	public final ServerSource source = ServerSource.LIBRARY;
	public static String hostUrl = "http://library.anu.edu.au";
	public String redirectUrl = "http://library.anu.edu.au/search/Y?SEARCH=";
	public Document document;
	public XPath xpath;

	public LibraryCatalogAdapter(String query) {
		// TODO Auto-generated constructor stub
		queryTerm = StringFormat.toURL(query);
		redirectUrl = redirectUrl + queryTerm;
			document = Parser.parse(redirectUrl);
		xpath = XPathFactory.newInstance().newXPath();
		t = new Thread(this, "Library Adapter");
	}

	@Override
	public RankList query(String query) {
		// TODO Auto-generated method stub
		if(document==null)
			return null;
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
		ResultTable.AddRankList(source, query(queryTerm));
	}

}
