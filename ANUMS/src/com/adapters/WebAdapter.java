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
import com.results.WebResult;
import com.util.Parser;
import com.util.StringFormat;

public class WebAdapter implements Adapter {

	Thread t;
	public String queryTerm;
	public int source = ServerSource.WEB;
	public static String hostUrl = "http://search.anu.edu.au/search/";
	public String redirectUrl = "http://search.anu.edu.au/search/search.cgi?collection=anu_search&query=";
	public Document document;
	public XPath xpath;
	public ResultTable results;
	public HashMap<Integer,Server> sTable=new HashMap<Integer,Server>();
	public WebAdapter(String query, ResultTable results,HashMap<Integer,Server>serverTable) {
		// TODO Auto-generated constructor stub
		queryTerm = StringFormat.toURL(query);
		redirectUrl = redirectUrl + queryTerm;
		this.results=results;
		this.sTable=serverTable;
		document = Parser.parse(redirectUrl);
		xpath = XPathFactory.newInstance().newXPath();
		t = new Thread(this, "Web Adapter");
	}

	public RankList query(String query) {
		if (document == null)
			return null;
		// transform string
		RankList ranklist = new RankList();
		Pattern pattern=Pattern.compile("\\S+\\s+search results");
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
			System.out.println("webtrue");
			String match=matcher.group();
			match=match.replaceAll(",", "");
			size=Integer.parseInt(match.substring(0, match.indexOf("search results")).trim());
		}
		Server server=new Server();
		server.setServer(source);
		server.setResult_size(size);
		sTable.put(source, server);
		try {
			NodeList nodeList = (NodeList) xpath.evaluate(
					"//OL[@id=\"fb-results\"]/LI", document,
					XPathConstants.NODESET);
			int length = nodeList.getLength();
			for (int i = 0; i < length; i++) {
				Element Node_Li = (Element) nodeList.item(i);
				Node Title = (Node) xpath.evaluate("H3", Node_Li,
						XPathConstants.NODE);
				Node Summary = (Node) xpath.evaluate(
						"P/SPAN[@class=\"fb-result-summary\"]", Node_Li,
						XPathConstants.NODE);
				Node Link = (Node) xpath.evaluate("P/CITE", Node_Li,
						XPathConstants.NODE);
				if (Title != null) {
					WebResult result = new WebResult();
					result.setLink("http://" + Link.getTextContent().trim());
					result.setTitle(Title.getTextContent().trim());
					result.setSummary(Summary.getTextContent().trim());
					result.setSource(source);
					result.setDsumary();
					ranklist.addResult(result);
				}
			}

		} catch (XPathExpressionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			Thread.sleep(500);
		} catch (InterruptedException e) {
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

	@Override
	public void run() {
		results.AddRankList(source, query(queryTerm));

	}

}
