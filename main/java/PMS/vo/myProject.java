package PMS.vo;

public class myProject {
	private int pno;
	private String title;
	private String dept;
	private String pmno;
	private int progAvg;
	public myProject() {
		super();
		// TODO Auto-generated constructor stub
	}
	public myProject(int pno, String title, String dept, String pmno, int progAvg) {
		super();
		this.pno = pno;
		this.title = title;
		this.dept = dept;
		this.pmno = pmno;
		this.progAvg = progAvg;
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
	public String getPmno() {
		return pmno;
	}
	public void setPmno(String pmno) {
		this.pmno = pmno;
	}
	public int getProgAvg() {
		return progAvg;
	}
	public void setProgAvg(int progAvg) {
		this.progAvg = progAvg;
	}
	
}
