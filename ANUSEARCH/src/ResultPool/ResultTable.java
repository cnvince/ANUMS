package ResultPool;

import java.util.HashMap;

public class ResultTable {
	private HashMap<String,RankList> ranking=new HashMap<String,RankList>();
	public ResultTable() {
		// TODO Auto-generated constructor stub
	}
	public RankList getRankList(String url)
	{
		return ranking.get(url);
	}
	public void AddRankList(String url,RankList list)
	{
		ranking.put(url, list);
	}
	//to check if the server is already exist
	public Boolean isServerExist(String url)
	{
		if(ranking.containsKey(url))
			return true;
		else
			return false;
			
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
