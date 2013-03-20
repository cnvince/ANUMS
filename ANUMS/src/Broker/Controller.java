package Broker;

import java.util.ArrayList;

import Adapters.AdapterFactory;
import MergingAlgorithms.SimpleRRMerger;
import ResultPool.ResultTable;
import Results.Result;
public class Controller {
//	ResultWritter rw=new ResultWritter();
	public Controller() {
		// TODO Auto-generated constructor stub
		
	}
	public ResultTable query(String queryString)
	{
		ResultTable map=new ResultTable();
		AdapterFactory factory=new AdapterFactory();
		factory.initialAdapters();
		map=factory.executeQuery(queryString);
//		display(map);
		System.out.println("result returned");
		return map;
	}
	public ArrayList<Result> merge(ResultTable map)
	{
		SimpleRRMerger merger=new SimpleRRMerger();
		return merger.executeMerging(map);
	}
	public ArrayList<Result> fetchResult(String Query)
	{
		ResultTable map=query(Query);
		return merge(map);
	}
//	public void display(ResultTable table)
//	{
//		HashMap<String,RankList> ranking=table.getTable();
////		System.out.println("listsize:"+ranking.size());
//		for(Entry<String,RankList> me:ranking.entrySet())
//		{
//			RankList list=me.getValue();
//			ArrayList<Result> results=list.getList();
//			for(Result result:results)
//			{
//				rw.write(result.getTitle()+":"+result.getLink()+" source:"+me.getKey());
////				ResultWritter.write(result.getTitle()+":"+result.getLink());
//			}
//		}
//	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Controller ctr=new Controller();
		ctr.query("paul");

	}

}
