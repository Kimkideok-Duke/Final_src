package PMS.vo;
// PMS.vo.Calendar
public class Calendar {
	private int id;
	private int pno;
	private int sno;
	private String title;
	private String start;
	private String end;
	private String content;
	private String borderColor;
	private String backgroundColor;
	private String textColor;
	private boolean allDay;
	
	public Calendar() {
		super();
	}

	public Calendar(int sno, String title, String start, String end) {
		super();
		this.sno = sno;
		this.title = title;
		this.start = start;
		this.end = end;
	}

	public Calendar(int pno, int sno, String title, String start, String end, String content, String backgroundColor,
			String textColor, boolean allDay) {
		super();
		this.pno = pno;
		this.sno = sno;
		this.title = title;
		this.start = start;
		this.end = end;
		this.content = content;
		this.backgroundColor = backgroundColor;
		this.textColor = textColor;
		this.allDay = allDay;
	}

	public Calendar(int id, int pno, int sno, String title, String start, String end, String content,
			String borderColor, String backgroundColor, String textColor, boolean allDay) {
		super();
		this.id = id;
		this.pno = pno;
		this.sno = sno;
		this.title = title;
		this.start = start;
		this.end = end;
		this.content = content;
		this.borderColor = borderColor;
		this.backgroundColor = backgroundColor;
		this.textColor = textColor;
		this.allDay = allDay;
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBorderColor() {
		return borderColor;
	}
	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public boolean isAllDay() {
		return allDay;
	}
	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}
	
}
