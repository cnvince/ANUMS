package com.adapters;

import java.io.IOException;

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
import com.results.YoutubeResult;
import com.util.Parser;
import com.util.StringFormat;

public class YouTubeAdapter implements Adapter {

	Thread t;
	public final ServerSource source = ServerSource.YOUTUBE;
	public String queryTerm = "";
	public static String hostUrl = "http://www.youtube.com";
	public Document document;
	public XPath xpath;
	String redirectUrl = "http://www.youtube.com/user/ANUchannel/videos?query=";

	public YouTubeAdapter(String query) {
		// TODO Auto-generated constructor stub
		queryTerm = StringFormat.toURL(query);
		redirectUrl = redirectUrl + queryTerm;
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
		ResultTable.AddRankList(source, query(queryTerm));
	}

}
