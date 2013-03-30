package com.adapters;

import com.datatype.ServerSource;
import com.resultpool.ResultTable;


public class AdapterFactory {

	private ContactAdapter contactAdapter;
	private LibraryCatalogAdapter libAdapter;
	private StudyAtAdapter studyatAdapter;
	private WebAdapter webadapter;
	private YouTubeAdapter youtubeAdapter;
	private MapAdapter mapAdapter;
	private ResearcherAdapter resAdapter;
	private ResearcherAdapter res_pubAdapter;
	private DspaceAdapter dspaceAdapter;

	public ResearcherAdapter getResAdapter() {
		return resAdapter;
	}

	public void setResAdapter(ResearcherAdapter resAdapter) {
		this.resAdapter = resAdapter;
	}

	public ResearcherAdapter getRes_pubAdapter() {
		return res_pubAdapter;
	}

	public void setRes_pubAdapter(ResearcherAdapter res_pubAdapter) {
		this.res_pubAdapter = res_pubAdapter;
	}

	public ResearcherAdapter getRes_proAdapter() {
		return res_proAdapter;
	}

	public void setRes_proAdapter(ResearcherAdapter res_proAdapter) {
		this.res_proAdapter = res_proAdapter;
	}

	private ResearcherAdapter res_proAdapter;

	public ContactAdapter getContactAdapter() {
		return contactAdapter;
	}

	public void setContactAdapter(ContactAdapter contactAdapter) {
		this.contactAdapter = contactAdapter;
	}

	public LibraryCatalogAdapter getLibAdapter() {
		return libAdapter;
	}

	public void setLibAdapter(LibraryCatalogAdapter libAdapter) {
		this.libAdapter = libAdapter;
	}

	public StudyAtAdapter getStudyatAdapter() {
		return studyatAdapter;
	}

	public void setStudyatAdapter(StudyAtAdapter studyatAdapter) {
		this.studyatAdapter = studyatAdapter;
	}

	public WebAdapter getWebadapter() {
		return webadapter;
	}

	public void setWebadapter(WebAdapter webadapter) {
		this.webadapter = webadapter;
	}

	public YouTubeAdapter getYoutubeAdapter() {
		return youtubeAdapter;
	}

	public void setYoutubeAdapter(YouTubeAdapter youtubeAdapter) {
		this.youtubeAdapter = youtubeAdapter;
	}

	public MapAdapter getMapAdapter() {
		return mapAdapter;
	}

	public void setMapAdapter(MapAdapter mapAdapter) {
		this.mapAdapter = mapAdapter;
	}

	public DspaceAdapter getDspaceAdapter() {
		return dspaceAdapter;
	}

	public void setDspaceAdapter(DspaceAdapter dspaceAdapter) {
		this.dspaceAdapter = dspaceAdapter;
	}

	public AdapterFactory() {
		// TODO Auto-generated constructor stub
	}

	// initial instances of adapters
	public void allocateAdapters(String query) {
		contactAdapter = new ContactAdapter(query);
		libAdapter = new LibraryCatalogAdapter(query);
		studyatAdapter = new StudyAtAdapter(query);
		webadapter = new WebAdapter(query);
		youtubeAdapter = new YouTubeAdapter(query);
		mapAdapter = new MapAdapter(query);
		resAdapter = new ResearcherAdapter(ServerSource.RESEARCHERS, query);
		res_pubAdapter = new ResearcherAdapter(ServerSource.RES_PUBLICATIONS,
				query);
		res_proAdapter = new ResearcherAdapter(ServerSource.RES_PROJECTS, query);
//		dspaceAdapter = new DspaceAdapter(query);
		contactAdapter.t.start();
		libAdapter.t.start();
		studyatAdapter.t.start();
		webadapter.t.start();
		youtubeAdapter.t.start();
		mapAdapter.t.start();
		resAdapter.t.start();
		res_pubAdapter.t.start();
		res_proAdapter.t.start();
//		dspaceAdapter.t.start();
		 try {
		 contactAdapter.t.join();
		 libAdapter.t.join();
		 studyatAdapter.t.join();
		 webadapter.t.join();
		 youtubeAdapter.t.join();
		 mapAdapter.t.join();
		 resAdapter.t.join();
		 res_pubAdapter.t.join();
		 res_proAdapter.t.join();
//		 dspaceAdapter.t.join();
		 } catch (InterruptedException e) {
		 // TODO Auto-generated catch block
		 e.printStackTrace();
		 }
	}

	public void executeQuery(String query) {
		allocateAdapters(query);
		System.out.println("com.results:" + ResultTable.getTable().size());
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AdapterFactory factory = new AdapterFactory();
		factory.executeQuery("paul");
	}

}
