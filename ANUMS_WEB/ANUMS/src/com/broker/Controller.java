package com.broker;

import java.util.ArrayList;

import com.adapters.AdapterFactory;
import com.mergingalgorithms.PRRMerger;
import com.mergingalgorithms.SimpleRRMerger;
import com.resultpool.ResultTable;
import com.results.Result;

public class Controller {
//	ResultWritter rw=new ResultWritter();
	public Controller() {
		// TODO Auto-generated constructor stub
		
	}
	
	public ArrayList<Result> fetchResult(String Query, String method)
	{
		System.out.println("method:"+method);
		AdapterFactory factory=new AdapterFactory();
		ResultTable results=factory.executeQuery(Query);
		if(method.equalsIgnoreCase("RandomRR"))
		{
			SimpleRRMerger merger=new SimpleRRMerger();
			return merger.executeMerging(results,null);
		}
		else if(method.equalsIgnoreCase("PrioritizedRR"))
		{
			PRRMerger merger=new PRRMerger();
			return merger.executeMerging(results, factory.ServerTable);
		}
		return null;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}

}
