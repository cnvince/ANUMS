package com.interfaces;


import com.resultpool.RankList;

public interface Adapter extends Runnable {
	public RankList query(String query);
//	public void initialResults();
}
