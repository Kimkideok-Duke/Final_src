package PMS.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;
// PMS.vo.Comment

public class Comment {
	private int cno;
	private int pno;  
	private int itemno;
	private String content;
	private Date regdte;
	private Date updte;
	private MultipartFile report;
	private String fname;
	
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Comment(int cno, int pno, int itemno, String content, Date regdte, Date updte) {
		this.cno = cno;
		this.pno = pno;
		this.itemno = itemno;
		this.content = content;
		this.regdte = regdte;
		this.updte = updte;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getItemno() {
		return itemno;
	}

	public void setItemno(int itemno) {
		this.itemno = itemno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdte() {
		return regdte;
	}

	public void setRegdte(Date regdte) {
		this.regdte = regdte;
	}

	public Date getUpdte() {
		return updte;
	}

	public void setUpdte(Date updte) {
		this.updte = updte;
	}
	
	public MultipartFile getReport() {
		return report;
	}
	public void setReport(MultipartFile report) {
		this.report = report;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}

}