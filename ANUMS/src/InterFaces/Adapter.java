package InterFaces;


import ResultPool.RankList;

public interface Adapter extends Runnable {
	public RankList query(String query);
//	public void initialResults();
}
