package Results;

public class StudyAtResult extends Result {
	public StudyAtResult(String category) {
		super();
		this.category = category;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = -8754662012443678676L;
	private String category;
	public StudyAtResult() {
		// TODO Auto-generated constructor stub
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
