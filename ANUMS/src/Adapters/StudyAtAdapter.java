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

import InterFaces.Adapter;
import ResultPool.RankList;
import Results.StudyAtResult;

public class StudyAtAdapter implements Adapter {

	public static String hostUrl="http://studyat.anu.edu.au";
	public StudyAtAdapter() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public RankList query(String query) throws XPathExpressionException {
		// TODO Auto-generated method stub
		query = StringFormat.toURL(query);
		RankList ranklist = new RankList();
		String redirectUrl = "http://studyat.anu.edu.au/search?search_terms="
				+ query;
		try {
			Document document = Parser.parse(redirectUrl);
			XPath xpath = XPathFactory.newInstance().newXPath();
			NodeList nodeList = (NodeList) xpath.evaluate(
					"//DIV[@class=\"search_result_set\"]", document,
					XPathConstants.NODESET);
//			System.out.println(nodeList.getLength());
			int length = nodeList.getLength();
			for (int i = 0; i < length; i++) {
				Element Node_Li = (Element) nodeList.item(i);
				Node Area = (Node) xpath.evaluate("H3", Node_Li,
						XPathConstants.NODE);
				String area = Area.getTextContent().trim();
//				System.out
//						.println("=================================================");
				NodeList ResultLink = (NodeList) xpath.evaluate(
						"DIV/P[@class=\"result_link\"]/B/A", Node_Li,
						XPathConstants.NODESET);
				for (int j = 0; j < ResultLink.getLength(); j++) {
					Element Link = (Element) ResultLink.item(j);
					String title = Link.getTextContent().trim();
					String link = "http://studyat.anu.edu.au"+Link.getAttribute("href").trim();
//					System.out.println(title + " " + link + " " + area);
					StudyAtResult result=new StudyAtResult();
					result.setTitle(title);
					result.setLink(link);
					result.setCategory(area);
					result.setSource("StudyAt");
					ranklist.addResult(result);
				}
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
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		StudyAtAdapter adapter = new StudyAtAdapter();
		try {
			adapter.query("paul Thomas");
		} catch (XPathExpressionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
