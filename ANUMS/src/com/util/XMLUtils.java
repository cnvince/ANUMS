package com.util;

import java.io.File;
import java.util.HashMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XMLUtils {

	public XMLUtils() {
		// TODO Auto-generated constructor stub
	}
	public static void disPlayXML(Document doc,String path)
	{
		TransformerFactory transformerFactory = TransformerFactory.newInstance();
		Transformer transformer;
		try {
			transformer = transformerFactory.newTransformer();
			DOMSource source = new DOMSource(doc);
			StreamResult result = new StreamResult(new File(path));
			transformer.transform(source, result);
			 
			System.out.println("File saved!");
		} catch (TransformerConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
 
		// Output to console for testing
		// StreamResult result = new StreamResult(System.out);
 
		
	}
	public static HashMap<Integer, String> ParseToHashMap(String path,String query) 
    {
        HashMap<Integer,String>hMap=new HashMap<Integer, String>();
        File file=new File(path);

        if(file.exists())
        {
           DocumentBuilderFactory factory=DocumentBuilderFactory.newInstance();
            try
            {
                DocumentBuilder builder = factory.newDocumentBuilder();
                Document document=builder.parse(file);
                Element documentElement=document.getDocumentElement();
                NodeList sList=documentElement.getElementsByTagName("Server");
                if (sList != null && sList.getLength() > 0)
                {
                    for (int i = 0; i < sList.getLength(); i++)
                    {
                        Node node = sList.item(i);
                        if(node.getNodeType()==Node.ELEMENT_NODE)
                        {
                            Element e = (Element) node;
                            int ID=Integer.parseInt(e.getAttribute("ID"));
                            NodeList nodeList = e.getElementsByTagName("Url");
                            String Url= nodeList.item(0).getChildNodes().item(0)
                                            .getNodeValue();
                            Url=Url.replaceAll("@query", query);

                            hMap.put(ID, Url);
                        }
                    }
                }
            } catch(Exception e){
                System.out.println("exception occured");
            }
        }else
        {
            System.err.println("Mapping url:File not exists,path:"+path);
        }
        return hMap;
    }
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
