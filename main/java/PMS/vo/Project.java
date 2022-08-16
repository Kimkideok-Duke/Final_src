package PMS.vo;

public class Project {
	private int pno;
	private String title;
	private String dept;
	private String pmno;
	private String name;
	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Project(int pno, String title, String dept, String pmno, String name) {
		super();
		this.pno = pno;
		this.title = title;
		this.dept = dept;
		this.pmno = pmno;
		this.name = name;
	}

	public Project(int pno, String title, String dept, String pmno) {
		super();
		this.pno = pno;
		this.title = title;
		this.dept = dept;
		this.pmno = pmno;
	}
	public Project(String title, String dept, String pmno) {
		super();
		this.title = title;
		this.dept = dept;
		this.pmno = pmno;
	}
	
	public Project(int pno, String title, String dept) {
		super();
		this.pno = pno;
		this.title = title;
		this.dept = dept;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
