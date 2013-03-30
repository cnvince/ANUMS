package com.resultpool;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import com.datatype.ServerSource;
import com.results.Result;


public class ResultTable {
	private static HashMap<ServerSource,RankList> ranking=new HashMap<ServerSource,RankList>();
	
	public ResultTable() {
		// TODO Auto-generated constructor stub
		
	}
	public static RankList getRankList(ServerSource url)
	{
		return ranking.get(url);
	}
	public static void AddRankList(ServerSource url,RankList list)
	{
		if(list!=null)
			ranking.put(url, list);
	}
	public static HashMap<ServerSource,RankList> getTable()
	{
		return ranking;
	}
	//to check if the server is already exist
	public static Boolean isServerExist(String url)
	{
		if(ranking.containsKey(url))
			return true;
		else
			return false;
			
	}
	public static void clearTable()
	{
		ranking.clear();
	}
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
