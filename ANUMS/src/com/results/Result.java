package com.results;

import org.w3c.dom.Document;

public class Result implements Comparable<Result>{

	/**
	 * 
	 */
	protected String Title;
	protected String Link;
	protected int Source;
	protected String imgLink="";
	protected String displaySummary;
	protected double score;
	public double getScore() {
		return score;
	}

	public void setScore(double d) {
		this.score = d;
	}

	public String getDisplaySummary() {
		return displaySummary;
	}

	public void setDisplaySummary(String displaySummary) {
		this.displaySummary = displaySummary;
	}

	public String getImgLink() {
		return imgLink;
	}

	public void setImgLink(String imgLink) {
		this.imgLink = imgLink;
	}

	public Result() {
		// TODO Auto-generated constructor stub
	}

	public Result(String title, String link, int source) {
		super();
		Title = title;
		Link = link;
		Source = source;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getLink() {
		return Link;
	}

	public void setLink(String link) {
		Link = link;
	}

	public int getSource() {
		return Source;
	}
	public String getSourceName()
	{
		switch(Source)
		{
			case 0:
				return "CONTACT";
			case 1:
				return "LIBRARY";
			case 2:
				return "STUDYAT";
			case 3:
				return "WEB";
			case 4:
				return "YOUTUBE";
			case 5:
				return "MAP";
			case 6:
				return "TWITTER";
			case 7:
				return "DSPACE";
			case 8:
				return "RESEARCHERS";
			case 9:
				return "RES_PUBLICATIONS";
			case 10:
				return "RES_PROJECTS";
				default:
					return null;
			
		}
	}
	public void setSource(int source2) {
		Source = source2;
	}
	//write result to xml document
	public void store()
	{
		
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	@Override
	public int compareTo(Result o) {
		// TODO Auto-generated method stub
		if(o.getScore()>this.score)
			return 1;
		else
			return 0;
	}

	public void store(Document doc) {
		// TODO Auto-generated method stub
		
	}

}
