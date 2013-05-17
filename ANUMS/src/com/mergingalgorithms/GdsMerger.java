package com.mergingalgorithms;

/*	
 * Author: PengFei Li
 * Date:11/04/2013
 * An algorithm from [1] Y. Rasolofo, D. Hawking, and J. Savoy, ÒResult merging strategies for a current news metasearcher,Ó Information Processing & Management, vol. 39, no. 4, pp. 581Ð609, Jul. 2003.
 * which use a generic document score function to calculate the score of each document,
 * using the Formula W=NQW/sqrt(L^2+LF^2) 
 * 
 */
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import org.tartarus.snowball.ext.englishStemmer;

import com.resultpool.RankList;
import com.resultpool.ResultTable;
import com.resultpool.Server;
import com.results.Result;

public class GdsMerger implements Merger {

	// define field type
	private static final int TS = 0;
	private static final int SS = 1;
	private static final int TSS = 2;
	// define xx field
	private int field = TS;
	// snowball stemmer
	public englishStemmer _stemmer;
	public String query;
	// final list
	public ArrayList<Result> mergedList;

	public GdsMerger(String query, int field) {
		this.query = query;
		_stemmer = new englishStemmer();
		this.field = field;
		mergedList = new ArrayList<Result>();
	}

	public void initScore(ResultTable results, int field) {
		HashMap<Integer, RankList> resultLists = results.getTable();
		for (Map.Entry<Integer, RankList> entry : resultLists.entrySet()) {
			RankList rankList = entry.getValue();
			ArrayList<Result> list = rankList.getList();
			int length = list.size();
			for (int i = 0; i < length; i++) {
				Result result = list.get(i);
				result.setScore(calScore(list, result, field));
				mergedList.add(result);
			}
		}
	}

	// use xx field to calculate the document score
	public double calScore(ArrayList<Result> results, Result result, int field) {
		double score = 0;
		switch (field) {
		case TS:
			score = getScore(result.getTitle());
			break;
		case SS:
			score = getScore(result.getDisplaySummary());
			break;
		case TSS:
			score = getScore(result.getTitle());
			if (score == 0)
				score = getScore(result.getDisplaySummary());
			if (score == 0)
				score = getRS(result, results);
		default:
			break;
		}
		return score;
	}

	public HashMap<String, Integer> getStemmer(String content) {
		HashMap<String, Integer> wordMap = new HashMap<String, Integer>();
		StringTokenizer st = new StringTokenizer(content);
		while (st.hasMoreTokens()) {
			_stemmer.setCurrent(st.nextToken());
			_stemmer.stem();
			String stem = _stemmer.getCurrent();
			if (wordMap.containsKey(stem)) {
				wordMap.put(stem, wordMap.get(stem) + 1);
			} else {
				wordMap.put(stem, 1);
			}
		}
		return wordMap;
	}

	public double getScore(String filedContent) {
		int NQW = 0;
		HashMap<String, Integer> queryMap = getStemmer(query);
		HashMap<String, Integer> fieldMap = getStemmer(filedContent);
		for (Map.Entry<String, Integer> entry : queryMap.entrySet()) {
			String term = entry.getKey();
			if (fieldMap.containsKey(term))
				NQW += fieldMap.get(term);
		}
		double score = NQW
				/ Math.sqrt(queryMap.size() * queryMap.size() + fieldMap.size()
						* fieldMap.size());
		return score;
	}

	// get the rank score
	public double getRS(Result result, ArrayList<Result> results) {
		int index = results.indexOf(results);
		// RS=(1000-RANK)/10000(range:0.099-0.0999)
		double score = (1000 - index + 1) / 10000;
		return score;
	}

	@Override
	public ArrayList<Result> executeMerging(ResultTable results,
			HashMap<Integer, Server> serverTable) {
		// TODO Auto-generated method stub
		this.initScore(results, field);
		Collections.sort(mergedList);
		return mergedList;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
