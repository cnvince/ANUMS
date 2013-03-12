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
import util.StringFormat;
import InterFaces.Adapter;
import ResultPool.RankList;
import Results.ContactResult;
import Results.Result;

public class ContactAdapter implements Adapter {

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
				System.out.println("true");
				pattern =Pattern.compile("Name:\\s+[\\w|\\s]+");
				matcher=pattern.matcher(context);
				while(matcher.find())
				{
					String name=matcher.group();
					name=name.substring(name.indexOf(":")+1, name.indexOf("Position")).trim();
//					System.out.println("Name:"+name);
					result.setTitle(name);
				}
				pattern =Pattern.compile("Position:\\s+[\\w|\\s]+");
				matcher=pattern.matcher(context);
				while(matcher.find())
				{
					String position=matcher.group();
					position=position.substring(position.indexOf(":")+1, position.indexOf("Phone")).trim();
//					System.out.println("Position:"+position);
					result.setPosition(position);
				}
				pattern =Pattern.compile("Phone:\\s+[\\d|\\s]+");
				matcher=pattern.matcher(context);
				while(matcher.find())
				{
					String phone=matcher.group();
					phone=phone.substring(phone.indexOf(":")+1).trim();
//					System.out.println("Phone:"+phone);
					result.setPhone(phone);
				}
				pattern =Pattern.compile("Email:\\s+[\\S]+@[\\S]+");
				matcher=pattern.matcher(context);
				while(matcher.find())
				{
					String email=matcher.group();
					email=email.substring(email.indexOf(":")+1, email.indexOf("Address")).trim();
//					System.out.println("Email:"+email);
					result.setEmail(email);
				}
				pattern =Pattern.compile("Address:\\s+.+[\\t|\\n]");
				matcher=pattern.matcher(context);
				while(matcher.find())
				{
					String address=matcher.group();
					address=address.substring(address.indexOf(":")+1).trim();
//					System.out.println("Address:"+address);
					result.setAddress(address);
				}
				result.setLink(redirectUrl);
				ranklist.addResult(result);
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
				System.out
						.println("=================================================");
				Node contact = tds.item(0);
				System.out.println(contact.getNodeName());
				Node Title = tds.item(1);
				Element Link = (Element) xpath.evaluate("A", Title,
						XPathConstants.NODE);
				Node Summary = tds.item(2);
				result.setTitle(Title.getTextContent().trim());
				result.setLink("link:" + Link.getAttribute("href").trim());
				result.setSummary(Summary.getTextContent().trim());
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
			ca.query("david hawking");
		} catch (XPathExpressionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
