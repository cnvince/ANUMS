package ResultPool;

import java.util.ArrayList;

import Results.Result;

public class RankList {

	private ArrayList<Result> ranking;
	public RankList() {
		// TODO Auto-generated constructor stub
		ranking=new ArrayList<Result>();
	}
	public void addResult(Result result)
	{
		ranking.add(result);
	}
	public int getRank(Result result)
	{
		return ranking.indexOf(result);
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
