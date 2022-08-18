package PMS.vo;

import java.util.Date;

public class Timeline {
private int pno;
private String sname;
private int cno;
private int sno;
private String writer;
private Date regdte;
private Date updte;

public Timeline() {
	super();
	// TODO Auto-generated constructor stub
}
public Timeline(int pno, String sname, int cno, int sno, String writer, Date regdte, Date updte) {
	this.pno = pno;
	this.sname = sname;
	this.cno = cno;
	this.sno = sno;
	this.writer = writer;
	this.regdte = regdte;
	this.updte = updte;
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

}
