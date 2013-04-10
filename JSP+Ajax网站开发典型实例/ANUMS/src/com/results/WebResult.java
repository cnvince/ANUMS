package com.results;

public class WebResult extends Result {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String Summary;
	public void setDsumary()
	{
		this.displaySummary=Summary;
	}
	public WebResult() {
		// TODO Auto-generated constructor stub
	}

	public String getSummary() {
		return Summary;
	}

	public WebResult(String summary) {
		super();
		Summary = summary;
	}

	public void setSummary(String summary) {
		Summary = summary;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
