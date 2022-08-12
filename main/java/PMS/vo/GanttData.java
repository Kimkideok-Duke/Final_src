package PMS.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class GanttData {
	private int sno;
	private String sname;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date startDate;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date endDate;
	private int progress;
	private int pno;
	public GanttData() {
		super();
	}
	public GanttData(int sno, String sname, Date startDate, Date endDate, int progress, int pno) {
		super();
		this.sno = sno;
		this.sname = sname;
		this.startDate = startDate;
		this.endDate = endDate;
		this.progress = progress;
		this.pno = pno;
	}
	public GanttData(int sno, String sname, Date startDate, Date endDate, int progress) {
		super();
		this.sno = sno;
		this.sname = sname;
		this.startDate = startDate;
		this.endDate = endDate;
		this.progress = progress;
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
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	
	
}
