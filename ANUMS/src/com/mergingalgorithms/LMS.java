package com.mergingalgorithms;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map.Entry;

import com.resultpool.RankList;
import com.resultpool.ResultTable;
import com.resultpool.Server;
import com.results.Result;
import com.util.ScoreFunction;

/**
 * @author Pengfei Li
 * @category A merging algorithm using result length to calculate merging score
 *	Added:14:26 23/04/2013
 */
public class LMS implements Merger {

	private final int K=600;
	private String query;
	public LMS(String query) {
		// TODO Auto-generated constructor stub
		this.query=query;
	}

	@Override
	public ArrayList<Result> executeMerging(ResultTable results,
			HashMap<Integer, Server> serverTable) {
		System.out.println("yes");
		ArrayList<Result> mergedList=new ArrayList<Result>();
//		initial the collection score
		this.initialSWeight(serverTable);
//		initial document scores(estimate) using the method in GDS by TTS+weight
		for(Entry<Integer, RankList> entry:results.getTable().entrySet())
		{
			int serverID=entry.getKey();
			System.out.println("Server:"+serverID);
			Server server=serverTable.get(serverID);
			
//			get the collection weight
			double weight=server.getWeight();
			RankList list=entry.getValue();
			for(int i=0;i<list.getList().size();i++)
			{
				Result result=list.getList().get(i);
				double score = ScoreFunction.getCosSimilarityByTF(query, result.getTitle()+" "+result.getDisplaySummary());
//				D'=(D+0.4*D*C')/1.4
//				double score=result.getScore();
				score=(score+0.4*score*weight)/1.4;
				result.setScore(score);
				mergedList.add(result);
			}
		}
		Collections.sort(mergedList);
		// TODO Auto-generated method stub
		return mergedList;
	}
	//initial a list of collections with its score
	public void  initialCScore(HashMap<Integer, Server> serverTable)
	{
		int totalLength=0;
		for(Entry<Integer, Server> entry:serverTable.entrySet())
		{
			int length=entry.getValue().getResult_size();
			totalLength+=length;
		}
		//applying the formula Si=log(1+li*K/(Total length across all collections));
		for(Entry<Integer, Server> entry:serverTable.entrySet())
		{
				Server server=entry.getValue();
				double score=Math.log(1+server.getResult_size()*K/totalLength);
				server.setScore(score);
		}
	}
//	calcualte the collection weight based on the server score
	public void initialSWeight(HashMap<Integer, Server> serverTable)
	{
		double totalScore=0;
		initialCScore(serverTable);
		for(Entry<Integer, Server> entry:serverTable.entrySet())
		{
			totalScore+=entry.getValue().getScore();
		}
//		get the average Score
		double avgScore=totalScore/serverTable.size();
//		initial weights
		for(Entry<Integer, Server> entry:serverTable.entrySet())
		{
			double weight=1+(entry.getValue().getScore()-avgScore)/avgScore;
			entry.getValue().setWeight(weight);
		}
		
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
