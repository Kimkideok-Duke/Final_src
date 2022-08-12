package PMS.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Schedule {
	private int sno;
	private int pno;
	private String sname;
	private String status;
	private int progress;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date startDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date endDate;
	private String startDate_s;
	private String endDate_s;
	private int budget;
	
	public Schedule() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Schedule(int sno, int pno, String sname, String status, int progress, Date startDate, Date endDate, int budget) {
		super();
		this.sno = sno;
		this.pno = pno;
		this.sname = sname;
		this.status = status;
		this.progress = progress;
		this.startDate = startDate;
		this.endDate = endDate;
		this.budget = budget;
	}
	public Schedule(int sno, int pno, String sname, String status, int progress, String startDate_s, String endDate_s, int budget) {
		super();
		this.sno = sno;
		this.pno = pno;
		this.sname = sname;
		this.status = status;
		this.progress = progress;
		this.startDate_s = startDate_s;
		this.endDate_s = endDate_s;
		this.budget = budget;
	}
	public Schedule(int sno, int progress) {
		super();
		this.sno = sno;
		this.progress = progress;
	}
	
	public Schedule(String sname, String status, int progress, String startDate_s, String endDate_s, int budget) {
			super();
			this.sname = sname;
			this.status = status;
			this.progress = progress;
			this.startDate_s = startDate_s;
			this.endDate_s = endDate_s;
			this.budget = budget;
		}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
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
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getStartDate_s() {
		return startDate_s;
	}
	public void setStartDate_s(String startDate_s) {
		this.startDate_s = startDate_s;
	}
	public String getEndDate_s() {
		return endDate_s;
	}
	public void setEndDate_s(String endDate_s) {
		this.endDate_s = endDate_s;
	}
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		this.budget = budget;
	}
	
}
