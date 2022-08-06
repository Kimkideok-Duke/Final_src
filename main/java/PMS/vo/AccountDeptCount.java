package PMS.vo;

public class AccountDeptCount {
	private String dept;
	private String count;
	public AccountDeptCount() {
		// TODO Auto-generated constructor stub
	}
	public AccountDeptCount(String dept, String count) {
		this.dept = dept;
		this.count = count;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
}
