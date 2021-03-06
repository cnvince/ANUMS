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
import Results.LibcataResult;

public class LibraryCatalogAdapter implements Adapter {

	public LibraryCatalogAdapter() {
		// TODO Auto-generated constructor stub
	}
	

	@Override
	public RankList query(String query)
			throws XPathExpressionException {
		// TODO Auto-generated method stub
		query=StringFormat.toURL(query);
		RankList ranklist=new RankList();
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
				LibcataResult result=new LibcataResult();
				System.out.println("=================================================");
				Node		Title = (Node) xpath.evaluate("TABLE//SPAN[@class=\"briefcitTitle\"]/A", ROW,
						XPathConstants.NODE);
				String title=Title.getTextContent().trim();
				result.setTitle(title);
				String Link=((Element)Title).getAttribute("href");
				result.setLink(Link);
				Node 		Summary= (Node) xpath.evaluate("TABLE//SPAN[@class=\"briefcitTitle\"]", ROW,
						XPathConstants.NODE);
				String textarea=Summary.getTextContent().trim();
				String summary=textarea.substring(title.length()+1).trim();
				result.setSummary(summary);
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
		LibraryCatalogAdapter adapter=new LibraryCatalogAdapter();
		try {
			adapter.query("machine learning");
		} catch (XPathExpressionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
