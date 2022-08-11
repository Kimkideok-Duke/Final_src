package PMS.vo;

public class getDeptCnt {
	private String dept;
	private int deptcnt;
	public getDeptCnt() {
		super();
		// TODO Auto-generated constructor stub
	}
	public getDeptCnt(String dept, int deptcnt) {
		super();
		this.dept = dept;
		this.deptcnt = deptcnt;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public int getDeptcnt() {
		return deptcnt;
	}
	public void setDeptcnt(int deptcnt) {
		this.deptcnt = deptcnt;
	}
	
}
