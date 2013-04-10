package com.resultpool;

public class Server implements Comparable<Server>{

	private int server;
	private int size;
	private float tf;
	private float idf;
	private int result_size;
	public Server() {
		// TODO Auto-generated constructor stub
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public float getTf() {
		return tf;
	}

	public void setTf(float tf) {
		this.tf = tf;
	}

	public float getIdf() {
		return idf;
	}

	public void setIdf(float idf) {
		this.idf = idf;
	}

	public int getResult_size() {
		return result_size;
	}

	public void setResult_size(int result_size) {
		this.result_size = result_size;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	public int getServer() {
		return server;
	}

	public void setServer(int server) {
		this.server = server;
	}

	@Override
	public int compareTo(Server o) {
		int size=o.getResult_size();
		return size-this.result_size;
	}

}
