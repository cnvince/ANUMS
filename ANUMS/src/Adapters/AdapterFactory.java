package Adapters;

import javax.xml.xpath.XPathExpressionException;

import ResultPool.ResultTable;

public class AdapterFactory {

	private ContactAdapter contactAdapter;
	private LibraryCatalogAdapter libAdapter;
	private StudyAtAdapter studyatAdapter;
	private WebAdapter webadapter;
	private YouTubeAdapter youtubeAdapter;
	private MapAdapter mapAdapter;
	private static String ContactUrl="contact";
	private static String LibUrl="library";
	private static String StuUrl="studyat";
	private static String webUrl="web";
	private static String youtubeUrl="youtube";
	private static String mapUrl="map";
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
	public AdapterFactory() {
		// TODO Auto-generated constructor stub
	}
	//initial instances of adapters
	public void initialAdapters()
	{
		contactAdapter	=new ContactAdapter();
		libAdapter		=new LibraryCatalogAdapter();
		studyatAdapter	=new StudyAtAdapter();
		webadapter		=new WebAdapter();
		youtubeAdapter	=new YouTubeAdapter();
		mapAdapter		=new MapAdapter();
	}
	public ResultTable executeQuery(String query)
	{
		ResultTable table=new ResultTable();
		try {
			table.AddRankList(ContactUrl,contactAdapter.query(query) );
			System.out.println("searching contact...");
			table.AddRankList(LibUrl, libAdapter.query(query));
			System.out.println("searching library...");
			table.AddRankList(StuUrl, studyatAdapter.query(query));
			System.out.println("searching studyat...");
			table.AddRankList(webUrl, webadapter.query(query));
			System.out.println("searching anuweb...");
			table.AddRankList(youtubeUrl, youtubeAdapter.query(query));
			System.out.println("searching youtube...");
			table.AddRankList(mapUrl, mapAdapter.query(query));
			System.out.println("searching map...");
			
		} catch (XPathExpressionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return table;
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
