package PMS.vo;

public class SchPartiInfo {
	private int pno;
	private int sno;
	private String userno;
	private String name;
	private String position;
	private String dept;
	public SchPartiInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SchPartiInfo(int pno, int sno, String userno, String name, String position, String dept) {
		super();
		this.pno = pno;
		this.sno = sno;
		this.userno = userno;
		this.name = name;
		this.position = position;
		this.dept = dept;
	}

	public SchPartiInfo(int sno, String userno, String name, String position, String dept) {
		super();
		this.sno = sno;
		this.userno = userno;
		this.name = name;
		this.position = position;
		this.dept = dept;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}
	
}
