package PMS.vo;

import java.util.Date;

public class Timeline {
private int tno;
private int pno; 
private String writer;
private String sname;
private Date tdte;
private String state;
//타임라인 계산
private String calTime;

public Timeline() {
	super();
	// TODO Auto-generated constructor stub
}

public Timeline(int tno, int pno, String writer, String sname, Date tdte, String state, String calTime) {
	this.tno = tno;
	this.pno = pno;
	this.writer = writer;
	this.sname = sname;
	this.tdte = tdte;
	this.state = state;
	this.calTime = calTime;
}

public int getTno() {
	return tno;
}

public void setTno(int tno) {
	this.tno = tno;
}

public int getPno() {
	return pno;
}

public void setPno(int pno) {
	this.pno = pno;
}

public String getWriter() {
	return writer;
}

public void setWriter(String writer) {
	this.writer = writer;
}

public String getSname() {
	return sname;
}

public void setSname(String sname) {
	this.sname = sname;
}

public Date getTdte() {
	return tdte;
}

public void setTdte(Date tdte) {
	this.tdte = tdte;
}

public String getState() {
	return state;
}

public void setState(String state) {
	this.state = state;
}

public String getCalTime() {
	return calTime;
}

public void setCalTime(String calTime) {
	this.calTime = calTime;
}


}