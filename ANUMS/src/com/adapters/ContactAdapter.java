package com.adapters;

import java.util.HashMap;
import java.util.concurrent.CountDownLatch;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.datatype.ServerSource;
import com.resultpool.RankList;
import com.resultpool.ResultTable;
import com.resultpool.Server;
import com.results.ContactResult;


public class ContactAdapter extends Adapter {

	

	public ContactAdapter(CountDownLatch countDownLatch, Document document,
			ResultTable results, HashMap<Integer, Server> serverTable,
			String hostUrl, int source) {
		super(countDownLatch, document, results, serverTable, hostUrl, source);
		// TODO Auto-generated constructor stub
	}
	public RankList query() {

		if(document==null)
			return null;
		Pattern pattern=Pattern.compile("\\d+ (item|items) returned");
		Node body;
		Matcher matcher = null;
		try {
			body = (Node) xpath
					.evaluate("//BODY", document,
							XPathConstants.NODE);
			matcher=pattern.matcher(body.getTextContent());
		} catch (XPathExpressionException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		int size=0;
		while(matcher.find())
		{
			System.out.println("true");
			String match=matcher.group();
			size=Integer.parseInt(match.substring(0, match.indexOf("item")).trim());
			System.out.println("size:"+size);
		}
		Server server=new Server();
		server.setServer(source);
		server.setResult_size(size);
		sTable.put(source, server);
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
						result.setLink(document.getDocumentURI());
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
	}


}
