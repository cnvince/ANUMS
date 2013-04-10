package com.results;

public class DSpaceResult extends Result {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6347942517328012722L;
	private String date="";
	private String author="";
	
	public DSpaceResult(String date, String imgLink, String author) {
		super();
		this.date = date;
		this.imgLink = imgLink;
		this.author = author;
	}
	public void setDsumary()
	{
		this.displaySummary=date+" "+author;
	}
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}


	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public DSpaceResult() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
