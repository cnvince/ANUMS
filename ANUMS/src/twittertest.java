import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.auth.AccessToken;
import twitter4j.auth.RequestToken;


public class twittertest {

	public twittertest() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// The factory instance is re-useable and thread safe.
	    Twitter twitter = TwitterFactory.getSingleton();
	    twitter.setOAuthConsumer("CLYDPzGfbZx77vvsflcEig", "osU7pwmEKanwIwnp8V7azkw0rNyozcEyVLVgRdIgzEY");
	    RequestToken requestToken;
		try {
			requestToken = twitter.getOAuthRequestToken();
			AccessToken accessToken = null;
			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
			while (null == accessToken) {
				System.out.println("Open the following URL and grant access to your account:");
				System.out.println(requestToken.getAuthorizationURL());
				System.out.print("Enter the PIN(if aviailable) or just hit enter.[PIN]:");
				String pin = br.readLine();
				try{
					if(pin.length() > 0){
						accessToken = twitter.getOAuthAccessToken(requestToken, pin);
					}else{
						accessToken = twitter.getOAuthAccessToken();
					}
				} catch (TwitterException te) {
					if(401 == te.getStatusCode()){
						System.out.println("Unable to get the access token.");
					}else{
						te.printStackTrace();
					}
				}
			}
			//persist to the accessToken for future reference.
			try {
				storeAccessToken(twitter.verifyCredentials().getId() , accessToken);
				Status status = twitter.updateStatus("7440084");
				System.out.println("Successfully updated the status to [" + status.getText() + "].");
			} catch (TwitterException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (TwitterException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    System.exit(0);
	}
	private static void storeAccessToken(long l, AccessToken accessToken){
	    //store accessToken.getToken()
	    //store accessToken.getTokenSecret()
	  }
	

}
