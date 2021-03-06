package Adapters;

import javax.xml.xpath.XPathExpressionException;

import ResultPool.ResultTable;

public class AdapterFactory {

	private ContactAdapter contactAdapter;
	private LibraryCatalogAdapter libAdapter;
	private StudyAtAdapter studyatAdapter;
	private WebAdapter webadapter;
	private YouTubeAdapter youtubeAdapter;
	private static String ContactUrl="contact";
	private static String LibUrl="library";
	private static String StuUrl="studyat";
	private static String webUrl="web";
	private static String youtubeUrl="youtube";
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
	}
	public ResultTable executeQuery(String query)
	{
		ResultTable table=new ResultTable();
		try {
			table.AddRankList(ContactUrl,contactAdapter.query(query) );
			table.AddRankList(LibUrl, libAdapter.query(query));
			table.AddRankList(StuUrl, studyatAdapter.query(query));
			table.AddRankList(webUrl, webadapter.query(query));
			table.AddRankList(youtubeUrl, youtubeAdapter.query(query));
			
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
