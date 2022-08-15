package PMS.vo;

public class ProjectBudget {
	private int pno;
	private String title;
	private double projectbudget;
	private String pmno;
	public ProjectBudget() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProjectBudget(int pno, String title, double projectbudget, String pmno) {
		super();
		this.pno = pno;
		this.title = title;
		this.projectbudget = projectbudget;
		this.pmno = pmno;
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
	public double getProjectbudget() {
		return projectbudget;
	}
	public void setProjectbudget(double projectbudget) {
		this.projectbudget = projectbudget;
	}
	public String getPmno() {
		return pmno;
	}
	public void setPmno(String pmno) {
		this.pmno = pmno;
	}
	
}
