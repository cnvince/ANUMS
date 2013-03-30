package com.broker;

import java.util.ArrayList;

import com.adapters.AdapterFactory;
import com.mergingalgorithms.SimpleRRMerger;
import com.results.Result;

public class Controller {
//	ResultWritter rw=new ResultWritter();
	public Controller() {
		// TODO Auto-generated constructor stub
		
	}
	
	public ArrayList<Result> fetchResult(String Query)
	{
		AdapterFactory factory=new AdapterFactory();
		factory.executeQuery(Query);
		System.out.println("result returned");
		System.out.println("right");
		SimpleRRMerger merger=new SimpleRRMerger();
		return merger.executeMerging();
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Controller ctr=new Controller();
		ctr.fetchResult("paul");
	}

}
