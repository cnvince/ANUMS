package com.mergingalgorithms;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.resultpool.RankList;
import com.resultpool.ResultTable;
import com.resultpool.Server;
import com.results.Result;

public class JMerger implements Merger {

	public JMerger() {
		// TODO Auto-generated constructor stub
	}

	public JMerger(String query) {
		// TODO Auto-generated constructor stub
	}

	@Override
	public ArrayList<Result> executeMerging(ResultTable results,
			HashMap<Integer, Server> serverTable) {
		// TODO Auto-generated method stub
		ArrayList<Result> mergedList=new ArrayList<Result>();
		HashMap<Integer, RankList> lists=results.getTable();
		for(Map.Entry<Integer, RankList> entry:lists.entrySet())
		{
			mergedList.addAll(entry.getValue().getList());
		}
		return mergedList;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
