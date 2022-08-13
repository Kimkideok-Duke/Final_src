package PMS.vo;
// PMS.vo.MypageScheduleList
public class MypageScheduleList {
	private String sname;
	private String title;
	private String pno;
	private String name;
	private String position;
	public MypageScheduleList() {
		// TODO Auto-generated constructor stub
	}
	public MypageScheduleList(String sname, String title, String pno, String name, String position) {
		this.sname = sname;
		this.title = title;
		this.pno = pno;
		this.name = name;
		this.position = position;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	
	
}
