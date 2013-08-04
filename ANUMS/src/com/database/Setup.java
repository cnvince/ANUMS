package com.database;

import java.beans.XMLEncoder;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.w3c.dom.Document;
import org.w3c.dom.Element;


import com.broker.Controller;
import com.datatype.ALGORITHM;
import com.results.Result;

public class Setup {

	public static int docNum=0;
	public Setup() {
		// TODO Auto-generated constructor stub
	}

	public void setupdb() {
		Datasource ds = new Datasource();
		ds.reset();
//		String fileName = "Queries/queries.txt";
//		// read from file
//		BufferedReader reader;
//		try {
//			reader = new BufferedReader(new FileReader(fileName));
//			String cquery;
//			DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
//			DocumentBuilder docBuilder;
//			Document doc=null;
//			docBuilder = docFactory.newDocumentBuilder();
//			doc = docBuilder.newDocument();
//			Element rootElement = doc.createElement("Results");
//			while ((cquery = reader.readLine()) != null) {
//				String query = cquery.trim();
//				ArrayList<Result> results = new ArrayList<Result>();
//				Controller controller = new Controller();
//				results = controller.fetchResult(query, ALGORITHM.JUDGE);
//				Element eQuery=doc.createElement("Query");
//				eQuery.setAttribute("value", query);
//				for (Result result : results) {
//					docNum++;
//					String docsPath="Documents/"+docNum+".xml";
////					result.store(doc);
//					FileOutputStream os = new FileOutputStream(docsPath);
//			        XMLEncoder encoder = new XMLEncoder(os);
//			        encoder.writeObject(result);
//			        encoder.close();
//			        Element eDoc=doc.createElement("doc");
//			        eDoc.appendChild(doc.createTextNode(Integer.toString(docNum)));
//			        rootElement.appendChild(eDoc);
//				}
//				doc.adoptNode(rootElement);
//				 Connector.Connect();
//				 Connection conn=Connector.getConnection();
//				 String
//				 Sql_query="INSERT INTO QUERIES (Q_TERM,ASSESSED) VALUES (? ,0)";
//				 PreparedStatement statement=null;
//				 try {
//				 statement=conn.prepareStatement(Sql_query);
//				 statement.setString(1, query);
//				 statement.executeUpdate();
//				 } catch (SQLException e) {
//				 // TODO Auto-generated catch block
//				 System.err.println(e.getMessage());
////				 Logger logr=Logger.getLogger(this.getClass());
////				 logr.info(e.getMessage());
//				 }
//				
//				 for (Result result : results) {
//				 String
//				 Sql_docs="INSERT INTO QUERY_DOCUMENT (Q_TERM, TITLE,LINK,SOURCE) VALUES (?,?,?,?)";
//				 try {
//				 statement = conn.prepareStatement(Sql_docs);
//				 statement.setString(1, query);
//				 String title=result.getTitle();
//				 if(title.length()>50)
//				 title=title.substring(0,50);
//				 statement.setString(2, title);
//				 statement.setString(3, result.getLink());
//				 statement.setString(4, result.getSourceName());
//				 statement.executeUpdate();
//				 } catch (SQLException e) {
//				 // TODO Auto-generated catch block
//				 e.printStackTrace();
//				 }
//				 }
//				 try {
//				 statement.close();
//				 } catch (SQLException e) {
//				 System.err.println(e.getMessage());
////				 Logger logr=Logger.getLogger(this.getClass());
////				 logr.info(e.getMessage());
//				 }
//				
//				 }
//				TransformerFactory transformerFactory = TransformerFactory.newInstance();
//				Transformer transformer = transformerFactory.newTransformer();
//				transformer.setOutputProperty(OutputKeys.INDENT, "yes");
//				DOMSource source = new DOMSource(doc);
//				StreamResult result = new StreamResult(new File("resultpool/results.xml"));
//				transformer.transform(source, result);
//				 
//				System.out.println("File saved!");
//			}
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (TransformerConfigurationException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (ParserConfigurationException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (TransformerException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		

	}

	public void setupdocs() {
		String fileName = "Queries/queries.txt";
		// read from file
		BufferedReader reader;
		try {
			reader = new BufferedReader(new FileReader(fileName));
			String cquery;
			DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder docBuilder;
			Document doc=null;
			docBuilder = docFactory.newDocumentBuilder();
			doc = docBuilder.newDocument();
			Element rootElement = doc.createElement("Results");
			while ((cquery = reader.readLine()) != null) {
				String query = cquery.trim();
				ArrayList<Result> results = new ArrayList<Result>();
				Controller controller = new Controller();
				results = controller.fetchResult(query, ALGORITHM.JUDGE);
				Element eQuery=doc.createElement("Query");
				eQuery.setAttribute("value", query);
				for (Result result : results) {
					docNum++;
					String link=result.getLink();
					String docsPath="Documents/"+docNum+".xml";
//					result.store(doc);
					FileOutputStream os = new FileOutputStream(docsPath);
			        XMLEncoder encoder = new XMLEncoder(os);
			        encoder.writeObject(result);
			        encoder.close();
			        Element eDoc=doc.createElement("doc");
			        eDoc.appendChild(doc.createTextNode(Integer.toString(docNum)));
			       eQuery.appendChild(eDoc);
			       downlaodPage(link,docNum);
				}
				rootElement.appendChild(eQuery);
			}
			doc.appendChild(rootElement);
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			transformer.setOutputProperty(OutputKeys.INDENT, "yes");
			DOMSource source = new DOMSource(doc);
			StreamResult result = new StreamResult(new File("resultpool/results.xml"));
			transformer.transform(source, result);
			System.out.println("File saved!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}
	public void downlaodPage(String link,int num)
	{
		// Create an instance of HttpClient.
	    HttpClient httpclient = new DefaultHttpClient();
	    HttpGet httpget = new HttpGet(link);
	    try {
	    	
			HttpResponse response = httpclient.execute(httpget);
			HttpEntity entity = response.getEntity();
			if(entity!=null)
			{
				OutputStream output = new FileOutputStream("pages/"+num+".html");
				entity.writeTo(output);
			}
	    } catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Setup setup = new Setup();
//		setup.setupdb();
		setup.setupdocs();

	}

}
