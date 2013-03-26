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

import DataType.ServerSource;
import InterFaces.Adapter;
import ResultPool.RankList;
import ResultPool.ResultTable;
import Results.StudyAtResult;

public class StudyAtAdapter implements Adapter {

	Thread t;
	public final ServerSource source = ServerSource.STUDYAT;
	public String queryTerm = "";
	public static String hostUrl = "http://studyat.anu.edu.au";
	public String redirectUrl = "http://studyat.anu.edu.au/search?search_terms=";
	public Document document;
	public XPath xpath;

	public StudyAtAdapter(String query) {
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
		t = new Thread(this, "StudyAt Adapter");
	}

	@Override
	public RankList query(String query) {
		// TODO Auto-generated method stub
		RankList ranklist = new RankList();
		try {
			NodeList nodeList = (NodeList) xpath.evaluate(
					"//DIV[@class=\"search_result_set\"]", document,
					XPathConstants.NODESET);
			int length = nodeList.getLength();
			for (int i = 0; i < length; i++) {
				Element Node_Li = (Element) nodeList.item(i);
				Node Area = (Node) xpath.evaluate("H3", Node_Li,
						XPathConstants.NODE);
				String area = Area.getTextContent().trim();
				NodeList ResultLink = (NodeList) xpath.evaluate(
						"DIV/P[@class=\"result_link\"]/B/A", Node_Li,
						XPathConstants.NODESET);
				for (int j = 0; j < ResultLink.getLength(); j++) {
					Element Link = (Element) ResultLink.item(j);
					String title = Link.getTextContent().trim();
					String link = "http://studyat.anu.edu.au"
							+ Link.getAttribute("href").trim();
					StudyAtResult result = new StudyAtResult();
					result.setTitle(title);
					result.setLink(link);
					result.setCategory(area);
					result.setSource(source);
					ranklist.addResult(result);
				}
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

	@Override
	public void run() {
		ResultTable.AddRankList(source, query(queryTerm));
	}

}
