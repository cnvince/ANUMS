package com.adapters;

//no duplication needed
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.concurrent.CountDownLatch;

import org.w3c.dom.Document;

import com.resultpool.RankList;
import com.resultpool.ResultTable;
import com.resultpool.Server;
import com.results.TwitterResult;

import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.auth.AccessToken;
import twitter4j.auth.RequestToken;
import twitter4j.conf.ConfigurationBuilder;

public class TwitterAdapter extends Adapter {

	private String Query;

	public TwitterAdapter(CountDownLatch countDownLatch, Document document,
			ResultTable results, HashMap<Integer, Server> serverTable,
			String hostUrl, int source, String query) {
		super(countDownLatch, document, results, serverTable, hostUrl, source);
		this.Query = query;
		// TODO Auto-generated constructor stub
	}

	@Override
	public RankList query() {
		RankList list = new RankList();
		ConfigurationBuilder cb = new ConfigurationBuilder();
		cb.setDebugEnabled(true)
		  .setOAuthConsumerKey("CLYDPzGfbZx77vvsflcEig")
		  .setOAuthConsumerSecret("osU7pwmEKanwIwnp8V7azkw0rNyozcEyVLVgRdIgzEY")
		  .setOAuthAccessToken("407380679-3ZGp2ZBAb5aWlvJqOKdOIMiWB8jOex6HszqbAlLB")
		  .setOAuthAccessTokenSecret("9uGp83ov4yTBbz1jRKiu3EcSb4O4y64cOJbCErlf4");
		TwitterFactory tf = new TwitterFactory(cb.build());
		Twitter twitter = tf.getInstance();
		 // The factory instance is re-useable and thread safe.
//	    Twitter twitter = TwitterFactory.getSingleton();
		try {
			Query query = new Query(Query + " @ANUMEDIA");
			QueryResult result;
			result = twitter.search(query);
			Server server = new Server();
			server.setServer(source);
			server.setResult_size(result.getTweets().size());
			sTable.put(source, server);
			HashSet<String> tweets = new HashSet<String>();
			// List<Status> tweets = result.getTweets();
			for (Status tweet : result.getTweets()) {
				if (!tweets.contains(tweet.getText())) {
					tweets.add(tweet.getText());
					TwitterResult tresult = new TwitterResult();
					tresult.setTitle(tweet.getText());
					tresult.setSource(source);
					tresult.setDisplaySummary(tweet.getUser() + " "
							+ tweet.getSource());
					long id=tweet.getId();
					String user=tweet.getUser().getName();
					String link="http://twitter.com/"+user.replaceAll(" ", "")+"/status/"+id;
					tresult.setLink(link);
					System.out.println("Title:"+tweet.getText()+"@" + tweet.getUser() + ":"
							+ tweet.getText());
					list.addResult(tresult);
					if (tweets.size() >= 10)
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
		TwitterAdapter twAdapter = new TwitterAdapter(null, null, null, null,
				null, 0, "3d");
		twAdapter.query();
	}

}
