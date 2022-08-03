package PMS.vo;
// PMS.vo.MypageScheduleList
public class MypageScheduleList {
	private String title;
	private String sname;
	private String name;
	private String position;
	public MypageScheduleList() {
		// TODO Auto-generated constructor stub
	}
	public MypageScheduleList(String title, String sname, String name, String position) {
		this.title = title;
		this.sname = sname;
		this.name = name;
		this.position = position;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
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
