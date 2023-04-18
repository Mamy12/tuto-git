package Classes;

public class Login {
	
	private int id;
	private String email;
	private String password;
	
	
	
	public Login(int id, String email, String password) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		
	}

	public Login(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public int getid() {
		return id;
	}

	public void setid(int id) {
		this.id = id;
	}

	public String getemail() {
		return email;
	}

	public void setemail(String email) {
		this.email = email;
	}

	public String getpassword() {
		return password;
	}

	public void setpassword(String password) {
		this.password = password;
	}

	
}
