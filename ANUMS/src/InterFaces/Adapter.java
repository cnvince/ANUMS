package InterFaces;

import javax.xml.xpath.XPathExpressionException;

import ResultPool.RankList;

public interface Adapter {
	public RankList query(String query) throws XPathExpressionException;
}
