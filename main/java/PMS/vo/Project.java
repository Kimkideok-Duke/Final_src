package PMS.vo;

public class Project {
	private int pno;
	private String title;
	private String dept;
	private String userno;
	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Project(int pno, String title, String dept, String userno) {
		super();
		this.pno = pno;
		this.title = title;
		this.dept = dept;
		this.userno = userno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
	
}
