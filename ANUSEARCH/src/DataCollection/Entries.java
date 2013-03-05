package DataCollection;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import java.util.ArrayList;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import util.Parser;

public class Entries {

	public Entries() {
		// TODO Auto-generated constructor stub
	}
	public static ArrayList<String> extractURLs(String URL) throws ParserConfigurationException, IOException, SAXException, XPathExpressionException
	{
		ArrayList<String> collections=new ArrayList<String>();
		Document document=Parser.parse(URL);
		XPath xpath = XPathFactory.newInstance().newXPath();
		NodeList nodeList = (NodeList) xpath.evaluate("//a[@href]", document,
				XPathConstants.NODESET);
		int length=nodeList.getLength();
		for(int i=0;i<length;i++)
		{
			Element element=(Element) nodeList.item(i);
			String link=element.getAttribute("href");
			if(link!=null&&link.trim().startsWith("http"))
			{
				System.out.println(link);
				collections.add(link);
			}
		}
		return collections;
	}
	public static ArrayList getForms(ArrayList URLs) throws ParserConfigurationException, IOException, SAXException, XPathExpressionException
	{
		ArrayList<NodeList> Forms=new ArrayList<NodeList>();
		for(String url:(ArrayList<String>)URLs)
		{
			System.out.println("processing: "+url);
			Document doc=Parser.parse(url);
			XPath xpath = XPathFactory.newInstance().newXPath();
			NodeList nodeList = (NodeList) xpath.evaluate("//form", doc,
					XPathConstants.NODESET);
//			if(nodeList!=null)
//			{
//				for(int i=0;i<nodeList.getLength();i++)
//					System.out.println(((Element)nodeList.item(i)).getAttribute("action"));
//				Forms.add(nodeList);
//			}
		}
		return Forms;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
//			Entries.extractURLs("http://www.anu.edu.au/a-z/");
			Entries.getForms(Entries.extractURLs("http://www.anu.edu.au/a-z/"));
		} catch (XPathExpressionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	}

}
