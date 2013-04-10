package com.mergingalgorithms;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;

import com.datatype.ServerSource;
import com.resultpool.RankList;
import com.resultpool.ResultTable;
import com.resultpool.Server;
import com.results.Result;


public class SimpleRRMerger implements Merger {

	public SimpleRRMerger() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public ArrayList<Result> executeMerging(ResultTable results,HashMap<Integer,Server> serverTable) {
		System.out.println("simple rr");
		long start=System.currentTimeMillis();
		// TODO Auto-generated method stub
		HashMap<Integer, RankList> table=results.getTable();
		int length=table.size();
		ArrayList<Result> mergedList=new ArrayList<Result>();
		ArrayList ranklists=new ArrayList();
		int MaxSize=0;
		int totalSize=0;
		int[] order = new int[table.size()];
		int a=0;
		for(Entry<Integer, RankList> me:table.entrySet())
		{
			order[a]=(me.getKey());
			a++;
		}
		order=randomOrder(order);
		for(int i=0;i<table.size();i++)
		{
			table.get(order[i]);
			ArrayList<Result> list=table.get(order[i]).getList();
			ranklists.add(list);
			if(list.size()>MaxSize)
				MaxSize=list.size();
			totalSize+=list.size();
		}
		for(int i=0;i<MaxSize;i++)
		{
			for(int j=0;j<ranklists.size();j++)
			{
				ArrayList<Result> list=(ArrayList<Result>) ranklists.get(j);
				if(list.size()>i)
				{
					mergedList.add(list.get(i));
				}
			}
		}
		System.out.println("Total:"+totalSize+" mergedSize:"+mergedList.size());
		long end=System.currentTimeMillis();
		System.out.println("merging: "+(end-start)+"s");
		return mergedList;
		
	}
	public int[] randomOrder(int[] order)
	{
		Random random=new Random();
		for(int i = order.length-1; i > 1 ; i--)
		{
			int randIndex = random.nextInt(i);
	        int temp = order[i];
	        order[i] = order[randIndex];
	        order[randIndex] = temp;
		}
//		for(int i=0;i<10;i++)
//		{
//			System.out.println(order[i]);
//		}
		return order;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SimpleRRMerger rr=new SimpleRRMerger();

	}

	

}
