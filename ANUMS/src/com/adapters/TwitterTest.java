package com.adapters;

import java.util.HashSet;

import org.apache.http.HttpVersion;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParams;
import org.apache.http.params.HttpProtocolParams;

import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Tweet;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;

public class TwitterTest {

	public TwitterTest() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// The factory instance is re-useable and thread safe.
	    Twitter twitter = TwitterFactory.getSingleton();
	    Query query = new Query("@ANUMEDIA");
	    QueryResult result;
		try {
			result = twitter.search(query);
			System.out.println("size:"+result.getTweets().size());
			HashSet<String> tweets=new HashSet<String>(); 
			for (Tweet status :result.getTweets()) {
				if(!tweets.contains(status.getText()))
				{
					tweets.add(status.getText());
					System.out.println("@" + status.getFromUser() + ":" + status.getText());
					
				}
			}
		} catch (TwitterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	}

}
