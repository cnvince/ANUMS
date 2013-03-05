/**
 * 
 */
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
import util.XMLUtils;

import Entities.Result;
import InterFaces.Adapter;

/**
 * @author user
 *
 */
public class LibrarySuperAdapter implements Adapter {

	/**
	 * 
	 */
	public LibrarySuperAdapter() {
		// TODO Auto-generated constructor stub
	}

	/* (non-Javadoc)
	 * @see Adapters.Adapter#query(java.lang.String)
	 */
	@Override
	public ArrayList<Result> query(String query)
			throws XPathExpressionException {
		query=StringFormat.toURL(query);
		ArrayList<Result> results=new ArrayList<Result>();
		String redirectUrl="http://anu.summon.serialssolutions.com/search?s.q="+query;
		try {
			Document document=Parser.parse(redirectUrl);
			XPath xpath = XPathFactory.newInstance().newXPath();
			NodeList nodeList = (NodeList) xpath.evaluate("//DIV[@class=\"document padded dotted\"]", document,
					XPathConstants.NODESET);
			System.out.println("length:"+nodeList.getLength());
			XMLUtils.disPlayXML(document, "test.txt");
//			int length=nodeList.getLength();
//			for(int i=0;i<length;i++)
//			{
//				Element 	Node_Li=(Element)nodeList.item(i);
//				System.out.println("=================================================");
//				Node		Title = (Node) xpath.evaluate("H3", Node_Li,
//						XPathConstants.NODE);
//				Node 		Summary= (Node) xpath.evaluate("P/SPAN[@class=\"fb-result-summary\"]", Node_Li,
//						XPathConstants.NODE);
//				Node 		Link= (Node) xpath.evaluate("P/CITE", Node_Li,
//						XPathConstants.NODE);
//				System.out.println("Title:"+Title.getTextContent().trim());
//				System.out.println("Summary:"+Summary.getTextContent().trim());
//				System.out.println("Link:"+Link.getTextContent().trim());
//			}
			
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
		LibrarySuperAdapter adapter=new LibrarySuperAdapter();
		try {
			adapter.query("Machine learning");
		} catch (XPathExpressionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
