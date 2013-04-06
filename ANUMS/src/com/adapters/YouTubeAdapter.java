package com.adapters;

import java.io.IOException;
import java.util.HashMap;

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
import com.results.YoutubeResult;
import com.util.Parser;
import com.util.StringFormat;

public class YouTubeAdapter implements Adapter {

	Thread t;
	private final int source = ServerSource.YOUTUBE;
	private String queryTerm = "";
	private static String hostUrl = "http://www.youtube.com";
	private Document document;
	private XPath xpath;
	private String redirectUrl = "http://www.youtube.com/user/ANUchannel/videos?query=";
	public ResultTable results;
	public HashMap<Integer,Server> sTable=new HashMap<Integer,Server>();
	public YouTubeAdapter(String query, ResultTable results,HashMap<Integer,Server> serverTable) {
		// TODO Auto-generated constructor stub
		queryTerm = StringFormat.toURL(query);
		redirectUrl = redirectUrl + queryTerm;
		this.results=results;
		this.sTable=serverTable;
		document = Parser.parse(redirectUrl);
		xpath = XPathFactory.newInstance().newXPath();
		t = new Thread(this, "Youtube Adapter");
	}

	/**
	 * @param args
	 * @throws ServiceException
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException {
	}

	@Override
	public RankList query(String query) {
		if (document == null)
			return null;
		
		RankList ranklist = new RankList();
		try {
			NodeList nodeList = (NodeList) xpath
					.evaluate(
							"//LI[@class=\"channels-content-item\"]/SPAN[@class=\"context-data-item\"]",
							document, XPathConstants.NODESET);
			int length = nodeList.getLength();
			Server server=new Server();
			server.setServer(source);
			server.setResult_size(length);
			sTable.put(source, server);
			for (int i = 0; i < length; i++) {
				Element Node_SPAN = (Element) nodeList.item(i);
				Node Summary = (Node) xpath.evaluate(
						"SPAN[@class=\"content-item-detail\"]/A", Node_SPAN,
						XPathConstants.NODE);
				Element summary = (Element) Summary;
				String Title = summary.getAttribute("title");
				String Link = summary.getAttribute("href");
				Node IMG = (Node) xpath.evaluate(
						"A//SPAN[@class=\"yt-thumb-clip-inner\"]//IMG",
						Node_SPAN, XPathConstants.NODE);
				String imgLink = ((Element) IMG).getAttribute("src");
				imgLink = imgLink.replaceAll("//", "");
				Node VIEWCOUNT = (Node) xpath
						.evaluate(
								"SPAN[@class=\"content-item-detail\"]//SPAN[@class=\"content-item-view-count\"]",
								Node_SPAN, XPathConstants.NODE);
				String count = VIEWCOUNT.getTextContent();
				count = count.substring(0, count.indexOf("views") - 1).trim();
				Node TIME = (Node) xpath
						.evaluate(
								"SPAN[@class=\"content-item-detail\"]//SPAN[@class=\"content-item-time-created\"]",
								Node_SPAN, XPathConstants.NODE);
				String time = TIME.getTextContent();
				YoutubeResult result = new YoutubeResult();
				result.setTitle(Title);
				result.setImgLink("http://" + imgLink);
				result.setLink(hostUrl + Link);
				// result.setSummary(summary);
				result.setTime(time);
				// result.setViewCount(Integer.parseInt(count));
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

	@Override
	public void run() {
		results.AddRankList(source, query(queryTerm));
	}

}
