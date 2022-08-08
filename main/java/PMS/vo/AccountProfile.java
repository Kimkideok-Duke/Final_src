package PMS.vo;

public class AccountProfile {
	private String userno;
	private String path;
	private String fname;
	public AccountProfile() {
		// TODO Auto-generated constructor stub
	}
	public AccountProfile(String userno, String path, String fname) {
		this.userno = userno;
		this.path = path;
		this.fname = fname;
	}
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	
}
