package util;

import java.io.IOException;
import java.io.InputStream;

import javax.xml.parsers.ParserConfigurationException;

import org.cyberneko.html.parsers.DOMParser;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

public class Parser {

	public Parser(String url) {
		// TODO Auto-generated constructor stub
	}

	public static Document parse(String urlstr)
			throws ParserConfigurationException, IOException, SAXException {
			long start=System.currentTimeMillis();
		   DOMParser parser = new DOMParser();
	        parser.setFeature("http://xml.org/sax/features/namespaces", false); // IMPORTANT!!
	        InputStream byteStream = util.InputStreamLoader.OpenStream(urlstr);
	        parser.parse(new org.xml.sax.InputSource(byteStream));
	        Document document = parser.getDocument();
	        long end=System.currentTimeMillis();
	        System.out.println(urlstr+":"+(end-start)/1000+"s");
		return document;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			Parser.parse("http://www.anu.edu.au/dirs/search.php?stype=Staff+Directory&querytext=david");
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
