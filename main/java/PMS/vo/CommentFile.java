package PMS.vo;

//PMS.vo.CommentFile
public class CommentFile {
	private int cno;
	private String fpath;
	private String fname;
	
	public CommentFile() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentFile(String fpath, String fname) {
		super();
		this.fpath = fpath;
		this.fname = fname;
	}

	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getFpath() {
		return fpath;
	}
	public void setFpath(String fpath) {
		this.fpath = fpath;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	
	
}
