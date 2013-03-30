package com.adapters;

import java.util.ArrayList;
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
import com.results.ContactResult;
import com.results.Result;
import com.util.Parser;
import com.util.StringFormat;


public class ContactAdapter implements Adapter {

	Thread t;
	public static String hostUrl = "http://www.anu.edu.au/dirs";
	public String queryTerm = "";
	public final ServerSource source = ServerSource.CONTACT;
	private XPath xpath = XPathFactory.newInstance().newXPath();
	private Document document;
	private String redirectUrl = "http://www.anu.edu.au/dirs/search.php?stype=Staff+Directory&querytext=";

	public ContactAdapter(String query) {
		queryTerm = StringFormat.toURL(query);
		redirectUrl = redirectUrl + queryTerm;
		document = Parser.parse(redirectUrl);
		t = new Thread(this, "ContactAdapter");
	}

	public RankList query(String query) {

		if(document==null)
			return null;
		RankList ranklist = new RankList();
		try {
			Node CenterNode=(Node) xpath.evaluate("//CENTER", document,
					XPathConstants.NODE);
			if(CenterNode!=null)
			{
				NodeList nodeList = (NodeList) xpath
						.evaluate("//CENTER//TABLE//TR", document,
								XPathConstants.NODESET);
				ContactResult result = new ContactResult();
				for (int i = 0; i < nodeList.getLength(); i++) {
					Node row = nodeList.item(i);
					String value = row.getTextContent().trim();
					if(value=="")
					{
						result.setSource(source);
						result.setLink(redirectUrl);
						result.setDsumary();
						ranklist.addResult(result);
						result=new ContactResult();
					}
					if (value.startsWith("Name")) {
						result.setTitle(value.substring(value.indexOf(":") + 1)
								.trim());
					} else if (value.startsWith("Position")) {
						result.setPosition(value.substring(
								value.indexOf(":") + 1).trim());
					} else if (value.startsWith("Phone")) {
						result.setPhone(value.substring(value.indexOf(":") + 1)
								.trim());
					} else if (value.startsWith("Email")) {
						result.setEmail(value.substring(value.indexOf(":") + 1)
								.trim());
					} else if (value.startsWith("Address")) {
						result.setAddress(value.substring(value.indexOf(":") + 1));
					}
				}
				return ranklist;
				
				
			}
			
			NodeList nodeList = (NodeList) xpath.evaluate("//P//TR", document,
					XPathConstants.NODESET);
			int length = nodeList.getLength();
			for (int i = 0; i < length; i++) {
				ContactResult result = new ContactResult();
				Element row = (Element) nodeList.item(i);
				NodeList tds = (NodeList) xpath.evaluate("TD", row,
						XPathConstants.NODESET);
				Node Title = tds.item(1);
				Element Link = (Element) xpath.evaluate("A", Title,
						XPathConstants.NODE);
				Node Summary = tds.item(2);
				result.setTitle(Title.getTextContent().trim());
				String link = Link.getAttribute("href").trim();
				link = hostUrl + link.substring(link.indexOf(".") + 1);
				result.setLink(link);
				result.setSummary(Summary.getTextContent().trim());
				result.setSource(ServerSource.CONTACT);
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
		ContactAdapter ad=new ContactAdapter("jerry");
		RankList list=ad.query("paul");
		ArrayList<Result> results=list.getList();
		for(int i=0;i<results.size();i++)
		{
			ContactResult result=(ContactResult) results.get(i);
			System.out.println(result.getTitle()+" "+result.getAddress()+" "+result.getEmail()+" "+result.getLink()+
					" "+result.getPhone()+" "+result.getPosition()+result.getSource());
		}
	}

	@Override
	public void run() {
		ResultTable.AddRankList(source, query(queryTerm));
	}

}
