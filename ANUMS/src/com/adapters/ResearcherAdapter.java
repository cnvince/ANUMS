package com.adapters;

import java.util.HashMap;
import java.util.concurrent.CountDownLatch;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.resultpool.RankList;
import com.resultpool.ResultTable;
import com.resultpool.Server;
import com.results.ResearcherResult;

public class ResearcherAdapter extends Adapter {

	public ResearcherAdapter(CountDownLatch countDownLatch, Document document,
			ResultTable results, HashMap<Integer, Server> serverTable,
			String hostUrl, int source) {
		super(countDownLatch, document, results, serverTable, hostUrl, source);
		// TODO Auto-generated constructor stub
	}

	@Override
	public RankList query() {
		if(document==null)
			return null;
		
		Pattern pattern=Pattern.compile("\\d+\\s+Next È");
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
			size=Integer.parseInt(match.substring(0, match.indexOf("Next È")).trim());
		}
		Server server=new Server();
		server.setServer(source);
		server.setResult_size(size);
		sTable.put(source, server);
		// TODO Auto-generated method stub
		RankList ranklist = new RankList();
		try {
			NodeList nodeList = (NodeList) xpath.evaluate(
					"//UL[@class=\"search_results\"]//DIV[@class=\"content\"]",
					document, XPathConstants.NODESET);
			int length = nodeList.getLength();
//			no more than 10 results returned
			if(length>10)
				length=10;
			for (int i = 0; i < length; i++) {
//				System.out.println("running " + source + "....");
				Node Content = nodeList.item(i);
				Node Title = (Node) xpath.evaluate("H3/A", Content,
						XPathConstants.NODE);
				String title = Title.getTextContent().trim();
				String link = hostUrl
						+ ((Element) Title).getAttribute("href").trim();
				Node Summary = (Node) xpath.evaluate("UL", Content,
						XPathConstants.NODE);
				String summary = Summary.getTextContent().trim();
				ResearcherResult result = new ResearcherResult();
				result.setLink(link);
				result.setSource(source);
				result.setSummary(summary);
				result.setTitle(title);
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
		// TODO Auto-generated method stub

		// ResearcherAdapter adapter=new
		// ResearcherAdapter(ServerSource.RES_PROJECTS);
		// adapter.query("paul");
	}



}
