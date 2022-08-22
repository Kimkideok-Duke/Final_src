package PMS.vo;

public class ScheduleStatusCnt {
	private int pno;
	private String status;
	private int stCnt;
	private int stRatio;
	private int stTotal;
	
	public ScheduleStatusCnt() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ScheduleStatusCnt(int pno, String status, int stCnt, int stRatio, int stTotal) {
		this.pno = pno;
		this.status = status;
		this.stCnt = stCnt;
		this.stRatio = stRatio;
		this.stTotal = stTotal;
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

	public int getStTotal() {
		return stTotal;
	}

	public void setStTotal(int stTotal) {
		this.stTotal = stTotal;
	}
	
}
