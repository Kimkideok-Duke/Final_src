package PMS.vo;

import java.util.Date;

public class Gantt {
	private int sno;
	private int pno;
	private String name;
	private String status;
	private Date start;
	private Date end;
	private int progress;
	private int budget;
	public Gantt() {
		// TODO Auto-generated constructor stub
	}
	public Gantt(int sno, int pno, String name, String status, Date start, Date end, int progress, int budget) {
		super();
		this.sno = sno;
		this.pno = pno;
		this.name = name;
		this.status = status;
		this.start = start;
		this.end = end;
		this.progress = progress;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		this.budget = budget;
	}
	
}
