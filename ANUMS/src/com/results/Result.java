package com.results;

import java.io.Serializable;

import com.datatype.ServerSource;


public class Result implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected String Title;
	protected String Link;
	protected ServerSource Source;
	protected String imgLink="";
	protected String displaySummary;
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

	public Result(String title, String link, ServerSource source) {
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

	public ServerSource getSource() {
		return Source;
	}

	public void setSource(ServerSource source) {
		Source = source;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
