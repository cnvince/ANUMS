package Adapters;

import java.io.IOException;
import java.util.ArrayList;

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
import Results.Result;

public class ContactAdapter implements Adapter{

	public ContactAdapter() {
		// TODO Auto-generated constructor stub
	}

	public RankList query(String query)
			throws XPathExpressionException {
		query =StringFormat.toURL(query);
		RankList ranklist=new RankList();
		String redirectUrl = "http://www.anu.edu.au/dirs/search.php?stype=Staff+Directory&querytext="
				+ query;
		System.out.println(redirectUrl);
		try {
			Document document = Parser.parse(redirectUrl);
			XPath xpath = XPathFactory.newInstance().newXPath();
			NodeList nodeList = (NodeList) xpath.evaluate("//P//TR", document,
					XPathConstants.NODESET);
			int length = nodeList.getLength();
			for (int i = 0; i < length; i++) {
				Element row = (Element) nodeList.item(i);
				NodeList tds = (NodeList) xpath.evaluate("TD", row,
						XPathConstants.NODESET);
				System.out
						.println("=================================================");
				Node contact = tds.item(0);
				System.out.println(contact.getNodeName());
				Node Title = tds.item(1);
				Element Link = (Element) xpath.evaluate("A", Title,
						XPathConstants.NODE);
				Node Summary = tds.item(2);
				System.out.println("contact:" + contact.getTextContent());
				System.out.println("title:" + Title.getTextContent());
				System.out.println("contact:" + contact.getTextContent());
				System.out.println("link:" + Link.getAttribute("href"));
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
		ContactAdapter ca = new ContactAdapter();
		try {
			ca.query("david's hawking");
		} catch (XPathExpressionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
