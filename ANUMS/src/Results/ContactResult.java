package Results;

public class ContactResult extends Result {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1897620677864216133L;
	private String Position;
	private String Phone;
	private String Email;
	private String Address;
	private String Summary;
	
	public String getPosition() {
		return Position;
	}

	public ContactResult(String position, String phone, String email,
			String address, String summary) {
		super();
		Position = position;
		Phone = phone;
		Email = email;
		Address = address;
		Summary = summary;
	}

	public void setPosition(String position) {
		Position = position;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getSummary() {
		return Summary;
	}

	public void setSummary(String summary) {
		Summary = summary;
	}

	public ContactResult() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
