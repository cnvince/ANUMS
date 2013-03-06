package Adapters;

import java.io.IOException;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import util.Parser;
import util.StringFormat;

import ResultPool.RankList;
import InterFaces.Adapter;

public class YouTubeAdapter implements Adapter {

	public YouTubeAdapter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param args
	 * @throws ServiceException
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		YouTubeAdapter yta = new YouTubeAdapter();
		try {
			yta.query("david");
		} catch (XPathExpressionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public RankList query(String query)
			throws XPathExpressionException {
		query=StringFormat.toURL(query);
		RankList ranklist=new RankList();
		String redirectUrl = "http://www.youtube.com/user/ANUchannel/videos?query="
				+ query;
		try {
			Document document = Parser.parse(redirectUrl);
			XPath xpath = XPathFactory.newInstance().newXPath();
			NodeList nodeList = (NodeList) xpath
					.evaluate(
							"//LI[@class=\"channels-content-item\"]/SPAN[@class=\"context-data-item\"]",
							document, XPathConstants.NODESET);
			System.out.println(nodeList.getLength());
			int length = nodeList.getLength();
			for (int i = 0; i < length; i++) {
				Element Node_SPAN = (Element) nodeList.item(i);
				System.out
						.println("=================================================");
				Node Summary = (Node) xpath.evaluate("SPAN[@class=\"content-item-detail\"]/A", Node_SPAN,
						XPathConstants.NODE);
				Element summary=(Element)Summary;
				String Title=summary.getAttribute("title");
				String Link=summary.getAttribute("href");
				Node IMG=(Node) xpath.evaluate("A//IMG", Node_SPAN,
						XPathConstants.NODE);
				String imgLink=((Element)IMG).getAttribute("src");
				Node VIEWCOUNT= (Node) xpath.evaluate("SPAN[@class=\"content-item-detail\"]//SPAN[@class=\"content-item-view-count\"]", Node_SPAN,
						XPathConstants.NODE);
				String count=VIEWCOUNT.getTextContent();
				Node TIME=(Node) xpath.evaluate("SPAN[@class=\"content-item-detail\"]//SPAN[@class=\"content-item-time-created\"]", Node_SPAN,
						XPathConstants.NODE);
				String time=TIME.getTextContent();
				System.out.println("Title:"+Title);
				System.out.println("Link:"+Link);
				System.out.println("ViewCount:"+count.trim());
				System.out.println("Time:"+time);
				System.out.println("ImageLink:"+imgLink);
			}

		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ranklist;
		// TODO Auto-generated method stub
	}

}
