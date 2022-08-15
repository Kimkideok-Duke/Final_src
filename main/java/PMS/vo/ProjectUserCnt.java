package PMS.vo;

public class ProjectUserCnt {
	private int pno;
	private String title;
	private int usercnt;
	public ProjectUserCnt() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProjectUserCnt(int pno, String title, int usercnt) {
		super();
		this.pno = pno;
		this.title = title;
		this.usercnt = usercnt;
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
	public int getUsercnt() {
		return usercnt;
	}
	public void setUsercnt(int usercnt) {
		this.usercnt = usercnt;
	}
	
}
