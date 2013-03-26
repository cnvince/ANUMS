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
import ResultPool.ResultTable;
import Results.WebResult;
import DataType.ServerSource;
import InterFaces.Adapter;

public class WebAdapter implements Adapter {

	Thread t;
	public String queryTerm;
	public ServerSource source = ServerSource.WEB;
	public static String hostUrl = "http://search.anu.edu.au/search/";
	public String redirectUrl = "http://search.anu.edu.au/search/search.cgi?collection=anu_search&query=";
	public Document document;
	public XPath xpath;

	public WebAdapter(String query) {
		// TODO Auto-generated constructor stub
		queryTerm = StringFormat.toURL(query);
		redirectUrl = redirectUrl + queryTerm;
		try {
			document = Parser.parse(redirectUrl);
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
		xpath = XPathFactory.newInstance().newXPath();
		t = new Thread(this, "Web Adapter");
	}

	public RankList query(String query) {
		// transform string
		RankList ranklist = new RankList();

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
		ResultTable.AddRankList(source, query(queryTerm));

	}

}
