package PMS.vo;

public class ScheduleStatusCnt {
	private int pno;
	private String status;
	private int StatusCnt;
	public ScheduleStatusCnt() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ScheduleStatusCnt(int pno, String status, int statusCnt) {
		this.pno = pno;
		this.status = status;
		StatusCnt = statusCnt;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getStatusCnt() {
		return StatusCnt;
	}
	public void setStatusCnt(int statusCnt) {
		StatusCnt = statusCnt;
	}
	
	
}
