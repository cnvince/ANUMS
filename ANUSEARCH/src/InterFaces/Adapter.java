package InterFaces;

import java.util.ArrayList;

import javax.xml.xpath.XPathExpressionException;

import Entities.Result;

public interface Adapter {
	public ArrayList<Result> query(String query) throws XPathExpressionException;
}
