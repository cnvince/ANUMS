package com.adapters;

import java.util.HashMap;
import java.util.concurrent.CountDownLatch;

import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import com.resultpool.RankList;
import com.resultpool.ResultTable;
import com.resultpool.Server;
import com.results.DSpaceResult;

public class DspaceAdapter extends Adapter {

	public DspaceAdapter(CountDownLatch countDownLatch, Document document,
			ResultTable results, HashMap<Integer, Server> serverTable,
			String hostUrl, int source) {
		super(countDownLatch, document, results, serverTable, hostUrl, source);
		// TODO Auto-generated constructor stub
	}

	@Override
	public RankList query() {
		if (document == null)
			return null;
		RankList ranklist = new RankList();
		try {

			NodeList nodeList = (NodeList) xpath.evaluate(
					"//TABLE[@class=\"miscTable\"]//TR", document,
					XPathConstants.NODESET);
			int length = nodeList.getLength();
			for (int i = 1; i < length; i++) {
				Element TR = (Element) nodeList.item(i);
				NodeList TD = (NodeList) xpath.evaluate("TD", TR,
						XPathConstants.NODESET);
				Node Preview = TD.item(0);
				Node IMG = (Node) xpath.evaluate("A/IMG", Preview,
						XPathConstants.NODE);
				String imgLink = "";
				if (IMG != null)
					imgLink = hostUrl + ((Element) IMG).getAttribute("src");
				Node Date = TD.item(1);
				String date = Date.getTextContent().trim();
				Node Title = TD.item(2);
				String title = Title.getTextContent().trim();
				String link = hostUrl + ((Element) Title).getAttribute("href");
				Node Author = TD.item(3);
				String author = Author.getTextContent().trim();
				DSpaceResult result = new DSpaceResult();
				result.setImgLink(imgLink);
				result.setAuthor(author);
				result.setDate(date);
				result.setLink(link);
				result.setSource(source);
				result.setTitle(title);
				result.setDsumary();
				ranklist.addResult(result);

			}

		} catch (XPathExpressionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// try {
		// Thread.sleep(500);
		// } catch (InterruptedException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		return ranklist;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// DspaceAdapter adapter=new DspaceAdapter();
		// try {
		// adapter.query("paul");
		// } catch (XPathExpressionException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
	}

	public void display() {
		System.out.println(this.source + "created...");
		for (int i = 0; i < 10; i++)
			System.out.println(this.source + ":" + i);
	}

}
