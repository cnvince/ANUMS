package com.adapters;

import java.util.HashMap;
import java.util.List;
import java.util.concurrent.CountDownLatch;

import org.w3c.dom.Document;

import com.resultpool.RankList;
import com.resultpool.ResultTable;
import com.resultpool.Server;

import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
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
		// TODO Auto-generated method stub
//		Twitter twitter = new TwitterFactory().getInstance();
//		QueryResult result;
//		try {
//			Query Cquery = new Query("@ANUmedia " + query);
//			System.out.println(Cquery);
//			result = twitter.search(Cquery);
//			List<Tweet> tweets = result.getTweets();
//			System.out.println(tweets.size());
//			for (Tweet tweet : tweets) {
//				System.out.println("=======================================");
//				System.out.println(tweet.getId());
//				Status status = twitter.showStatus(tweet.getId());
//				// System.out.println(status.getSource());
//				System.out.println("Twitter:" + status.getText());
//				System.out.println("User:" + status.getUser().getName());
//			}
//		} catch (TwitterException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}

		return null;
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
