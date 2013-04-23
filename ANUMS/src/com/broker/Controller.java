package com.broker;

import java.util.ArrayList;

import com.adapters.AdapterFactory;
import com.mergingalgorithms.GdsMerger;
import com.mergingalgorithms.Merger;
import com.mergingalgorithms.PRRMerger;
import com.mergingalgorithms.SimpleRRMerger;
import com.resultpool.ResultTable;
import com.results.Result;

public class Controller {
	// ResultWritter rw=new ResultWritter();
	// fields for METHODs.
	private final int SRR = 0;
	private final int PRR = 1;
	private final int GDS_TS = 2;
	private final int GDS_SS = 3;
	private final int GDS_TSS = 4;
	// define GDS field type
	private final int TS = 0;
	private final int SS = 1;
	private final int TSS = 2;

	public Controller() {
		// TODO Auto-generated constructor stub

	}

	public ArrayList<Result> fetchResult(String Query, int method) {
		System.out.println("method:" + method);
		AdapterFactory factory = new AdapterFactory();
		ResultTable results = factory.executeQuery(Query);
		Merger merger = null;
		switch (method) {
		// Random Round-Robin
		case SRR:
			merger = new SimpleRRMerger();
			break;
		case PRR:
			merger = new PRRMerger();
			break;
		case GDS_TS:
			merger = new GdsMerger(Query, TS);
			break;
		case GDS_SS:
			merger = new GdsMerger(Query, SS);
			break;
		case GDS_TSS:
			merger = new GdsMerger(Query, TSS);
			break;
		default:
			break;
		}
		return merger.executeMerging(results, factory.ServerTable);

	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}

}
