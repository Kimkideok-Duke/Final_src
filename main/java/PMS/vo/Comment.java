package PMS.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;
// PMS.vo.Comment

public class Comment {
	private int cno;
	private int sno;
	private String content;
	private String writer;
	private Date regdte;
	private Date updte;
	private MultipartFile report;
	private String fname;
	
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Comment(int cno, int sno, String content, String writer, Date regdte, Date updte, MultipartFile report,
			String fname) {
		this.cno = cno;
		this.sno = sno;
		this.content = content;
		this.writer = writer;
		this.regdte = regdte;
		this.updte = updte;
		this.report = report;
		this.fname = fname;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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