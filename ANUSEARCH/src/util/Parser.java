package util;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

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

		   DOMParser parser = new DOMParser();
	        parser.setFeature("http://xml.org/sax/features/namespaces", false); // IMPORTANT!!
	        InputStream byteStream = util.InputStreamLoader.OpenStream(urlstr);
	        parser.parse(new org.xml.sax.InputSource(byteStream));
	        Document document = parser.getDocument();
		// Logger.getLogger("org.lobobrowser").setLevel(Level.WARNING);
		// UserAgentContext uacontext = new SimpleUserAgentContext();
		// // In this case we will use a standard XML document
		// // as opposed to Cobra's HTML DOM implementation.
		// DocumentBuilderFactory factory =
		// DocumentBuilderFactory.newInstance();
		// DocumentBuilder builder = factory.newDocumentBuilder();
		// URL url = new URL(urlstr);
		// InputStream in = url.openConnection().getInputStream();
		// Reader reader = new InputStreamReader(in, "UTF-8");
		// Document document = builder.newDocument();
		// // Here is where we use Cobra's HTML parser.
		// HtmlParser parser = new HtmlParser(uacontext, document);
		// System.out.println(urlstr);
		// parser.parse(reader);
		// in.close();
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
