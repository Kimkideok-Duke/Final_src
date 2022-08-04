package PMS.vo;

import java.util.Date;

public class Alert {
	private String userno;
	private int pno;
	private int sno;
	private String sname;
	private String status;
	private Date dday;
	public Alert() {
		// TODO Auto-generated constructor stub
	}
	public Alert(String userno, int pno, int sno, String sname, String status, Date dday) {
		super();
		this.userno = userno;
		this.pno = pno;
		this.sno = sno;
		this.sname = sname;
		this.status = status;
		this.dday = dday;
	}
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
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
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getDday() {
		return dday;
	}
	public void setDday(Date dday) {
		this.dday = dday;
	}
	

}
