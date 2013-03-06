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

import Entities.Result;
import InterFaces.Adapter;

public class LibraryCatalogAdapter implements Adapter {

	public LibraryCatalogAdapter() {
		// TODO Auto-generated constructor stub
	}
	

	@Override
	public ArrayList<Result> query(String query)
			throws XPathExpressionException {
		// TODO Auto-generated method stub
		query=StringFormat.toURL(query);
		ArrayList<Result> results=new ArrayList<Result>();
		String redirectUrl="http://library.anu.edu.au/search/Y?SEARCH="+query;
		try {
			Document document=Parser.parse(redirectUrl);
			XPath xpath = XPathFactory.newInstance().newXPath();
			NodeList nodeList = (NodeList) xpath.evaluate("//TD[@class=\"briefCitRow\"]", document,
					XPathConstants.NODESET);
			System.out.println(nodeList.getLength());
			int length=nodeList.getLength();
			for(int i=0;i<length;i++)
			{
				Element 	ROW=(Element)nodeList.item(i);
				System.out.println("=================================================");
				Node		Title = (Node) xpath.evaluate("TABLE//SPAN[@class=\"briefcitTitle\"]/A", ROW,
						XPathConstants.NODE);
				String title=Title.getTextContent().trim();
//				System.out.println(ti	tle);
				String Link=((Element)Title).getAttribute("href");
				Node 		Summary= (Node) xpath.evaluate("TABLE//SPAN[@class=\"briefcitTitle\"]", ROW,
						XPathConstants.NODE);
				System.out.println("Title:"+title.trim());
				String textarea=Summary.getTextContent().trim();
				String summary=textarea.substring(title.length()+1).trim();
				System.out.println("Summary:"+summary);
				System.out.println("Link:"+Link.trim());
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
		return results;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		LibraryCatalogAdapter adapter=new LibraryCatalogAdapter();
		try {
			adapter.query("machine learning");
		} catch (XPathExpressionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}