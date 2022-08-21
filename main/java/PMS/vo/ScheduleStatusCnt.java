package PMS.vo;

public class ScheduleStatusCnt {
	private int pno;
	private String status;
	private int stCnt;
	private int stRatio;
	public ScheduleStatusCnt() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ScheduleStatusCnt(int pno, String status, int stCnt, int stRatio) {
		this.pno = pno;
		this.status = status;
		this.stCnt = stCnt;
		this.stRatio = stRatio;
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
	public int getStCnt() {
		return stCnt;
	}
	public void setStCnt(int stCnt) {
		this.stCnt = stCnt;
	}
	public int getStRatio() {
		return stRatio;
	}
	public void setStRatio(int stRatio) {
		this.stRatio = stRatio;
	}
}
