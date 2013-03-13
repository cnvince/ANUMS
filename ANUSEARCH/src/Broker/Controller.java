package Broker;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import util.ResultWritter;

import Adapters.AdapterFactory;
import ResultPool.RankList;
import ResultPool.ResultTable;
import Results.Result;

public class Controller {
	ResultWritter rw=new ResultWritter();
	public Controller() {
		// TODO Auto-generated constructor stub
		
	}
	public ResultTable query(String queryString)
	{
		ResultTable map=new ResultTable();
		AdapterFactory factory=new AdapterFactory();
		factory.initialAdapters();
		map=factory.executeQuery(queryString);
		display(map);
		return map;
	}
	public void display(ResultTable table)
	{
		HashMap<String,RankList> ranking=table.getTable();
		System.out.println("listsize:"+ranking.size());
		for(Entry<String,RankList> me:ranking.entrySet())
		{
			RankList list=me.getValue();
			System.out.println(me.getKey());
			ArrayList<Result> results=list.getList();
			for(Result result:results)
			{
				rw.write(result.getTitle()+":"+result.getLink());
//				ResultWritter.write(result.getTitle()+":"+result.getLink());
			}
		}
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Controller ctr=new Controller();
		ctr.query("paul");

	}

}
