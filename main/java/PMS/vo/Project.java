package PMS.vo;

public class Project {
	private int pno;
	private String title;
	private String team;
	private String userno;
	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Project(int pno, String title, String team, String userno) {
		super();
		this.pno = pno;
		this.title = title;
		this.team = team;
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
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
	
}
