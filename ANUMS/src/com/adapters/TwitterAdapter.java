package com.adapters;

import java.util.HashMap;
import java.util.HashSet;
import java.util.concurrent.CountDownLatch;

import org.w3c.dom.Document;

import com.resultpool.RankList;
import com.resultpool.ResultTable;
import com.resultpool.Server;
import com.results.TwitterResult;

import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Tweet;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;

public class TwitterAdapter extends Adapter {


	public TwitterAdapter(CountDownLatch countDownLatch, Document document,
			ResultTable results, HashMap<Integer, Server> serverTable,
			String hostUrl, int source) {
		super(countDownLatch, document, results, serverTable, hostUrl, source);
		// TODO Auto-generated constructor stub
	}

	@Override
	public RankList query() {
		RankList list=new RankList();
		// The factory instance is re-useable and thread safe.
	    Twitter twitter = TwitterFactory.getSingleton();
	    Query query = new Query("@ANUMEDIA");
	    QueryResult result;
		try {
			result = twitter.search(query);
			System.out.println("size:"+result.getTweets().size());
			Server server=new Server();
			server.setServer(source);
			server.setResult_size(result.getTweets().size());
			sTable.put(source, server);
			HashSet<String> tweets=new HashSet<String>(); 
			for (Tweet tweet :result.getTweets()) {
				if(!tweets.contains(tweet.getText()))
				{
					tweets.add(tweet.getText());
					TwitterResult tresult=new TwitterResult();
					tresult.setTitle(tweet.getText());
					tresult.setSource(source);
					tresult.setDisplaySummary(tweet.getFromUser()+" "+tweet.getFromUserName()+" "+tweet.getSource());
//					System.out.println("@" + tweet.getFromUser() + ":" + tweet.getText());
					list.addResult(tresult);
					if(tweets.size()>=10)
						break;
				}
			}
		} catch (TwitterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		TwitterAdapter twAdapter = new TwitterAdapter();
//		twAdapter.query("student");
	}


}
