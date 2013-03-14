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

import ResultPool.RankList;
import Results.WebResult;
import InterFaces.Adapter;
public class WebAdapter implements Adapter{

	public WebAdapter() {
		// TODO Auto-generated constructor stub
	}
	public RankList query(String query) throws XPathExpressionException
	{
		//transform string
		query=StringFormat.toURL(query);
		RankList ranklist=new RankList();
		
		String redirectUrl="http://search.anu.edu.au/search/search.cgi?collection=anu_search&query="+query;
		try {
			Document document=Parser.parse(redirectUrl);
			XPath xpath = XPathFactory.newInstance().newXPath();
			NodeList nodeList = (NodeList) xpath.evaluate("//OL[@id=\"fb-results\"]/LI", document,
					XPathConstants.NODESET);
//			System.out.println(nodeList.getLength());
			int length=nodeList.getLength();
			for(int i=0;i<length;i++)
			{
				Element 	Node_Li=(Element)nodeList.item(i);
//				System.out.println("=================================================");
				Node		Title = (Node) xpath.evaluate("H3", Node_Li,
						XPathConstants.NODE);
				Node 		Summary= (Node) xpath.evaluate("P/SPAN[@class=\"fb-result-summary\"]", Node_Li,
						XPathConstants.NODE);
				Node 		Link= (Node) xpath.evaluate("P/CITE", Node_Li,
						XPathConstants.NODE);
				WebResult result=new WebResult();
				result.setLink(Link.getTextContent().trim());
				result.setTitle(Title.getTextContent().trim());
				result.setSummary(Summary.getTextContent().trim());
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
		WebAdapter wa=new WebAdapter();
		try {
			wa.query("david");
		} catch (XPathExpressionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
