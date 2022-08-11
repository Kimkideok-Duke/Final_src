package PMS.vo;

public class DeptBudget {
	private String dept;
	private double deptbudget;
	public DeptBudget() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DeptBudget(String dept, double deptbudget) {
		super();
		this.dept = dept;
		this.deptbudget = deptbudget;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public double getDeptbudget() {
		return deptbudget;
	}
	public void setDeptbudget(double deptbudget) {
		this.deptbudget = deptbudget;
	}
	
}
