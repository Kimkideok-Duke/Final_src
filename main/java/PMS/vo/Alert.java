package PMS.vo;

public class Alert {
	private String userno;
	private String title;
	private String sname;
	private String status;
	private int dday;
	public Alert() {
		// TODO Auto-generated constructor stub
	}
	public Alert(String userno, String title, String sname, String status, int dday) {
		super();
		this.userno = userno;
		this.title = title;
		this.sname = sname;
		this.status = status;
		this.dday = dday;
	}
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getDday() {
		return dday;
	}
	public void setDday(int dday) {
		this.dday = dday;
	}

}
