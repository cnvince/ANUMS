package Adapters;

import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import util.ResultWritter;
import util.StringFormat;
import InterFaces.Adapter;
import ResultPool.RankList;
import Results.ContactResult;
import Results.Result;

public class ContactAdapter implements Adapter {

	ResultWritter rw=new ResultWritter();
	public ContactAdapter() {
		// TODO Auto-generated constructor stub
	}

	public RankList query(String query) throws XPathExpressionException {
		query = StringFormat.toURL(query);
		RankList ranklist = new RankList();
		String redirectUrl = "http://www.anu.edu.au/dirs/search.php?stype=Staff+Directory&querytext="
				+ query;
		System.out.println(redirectUrl);
		try {
			Document document = Parser.parse(redirectUrl);
			XPath xpath = XPathFactory.newInstance().newXPath();
			Node root = (Node) xpath.evaluate("//BODY", document,
					XPathConstants.NODE);
			String context = root.getTextContent();
//			 System.out.println("CONTEXT:"+context);
			Pattern pattern = Pattern.compile("(\\d)+ item returned");
			Matcher matcher = pattern.matcher(context);
			if (matcher.find()) {
				ContactResult result=new ContactResult();
				NodeList nodeList = (NodeList) xpath.evaluate("//CENTER//TABLE//TR", document,
						XPathConstants.NODESET);
				System.out.println(nodeList.getLength());
				for(int i=0;i<nodeList.getLength();i++)
				{
					Node row=nodeList.item(i);
					String value=row.getTextContent().trim();
					System.out.println(value);
					if(value.startsWith("Name"))
					{
						result.setTitle(value.substring(value.indexOf(":")+1).trim());
					}
					else if(value.startsWith("Position"))
					{
						result.setPosition(value.substring(value.indexOf(":")+1).trim());
					}
					else if(value.startsWith("Phone"))
					{
						result.setPhone(value.substring(value.indexOf(":")+1).trim());
					}
					else if(value.startsWith("Email"))
					{
						result.setEmail(value.substring(value.indexOf(":")+1).trim());
					}
					else if(value.startsWith("Address"))
					{
						result.setAddress(value.substring(value.indexOf(":")+1));
					}
				}
				result.setLink(redirectUrl);
				ranklist.addResult(result);
				
//				rw.write(result.getLink());
				return ranklist;
			}
			NodeList nodeList = (NodeList) xpath.evaluate("//P//TR", document,
					XPathConstants.NODESET);
			int length = nodeList.getLength();
			for (int i = 0; i < length; i++) {
				ContactResult result=new ContactResult();
				Element row = (Element) nodeList.item(i);
				NodeList tds = (NodeList) xpath.evaluate("TD", row,
						XPathConstants.NODESET);
//				System.out
//						.println("=================================================");
				Node contact = tds.item(0);
//				System.out.println(contact.getNodeName());
				Node Title = tds.item(1);
				Element Link = (Element) xpath.evaluate("A", Title,
						XPathConstants.NODE);
				Node Summary = tds.item(2);
				result.setTitle(Title.getTextContent().trim());
				result.setLink(Link.getAttribute("href").trim());
				result.setSummary(Summary.getTextContent().trim());
//				rw.write(result.getLink());
				ranklist.addResult(result);
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
			ca.query("paul");
		} catch (XPathExpressionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
