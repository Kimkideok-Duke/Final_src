package PMS.vo;

import java.util.Date;

public class Timeline {
private int tno;
private int pno; 
private int sno;
private String writer;
private Date tdte;
private String state;

public Timeline() {
	super();
	// TODO Auto-generated constructor stub
}
public Timeline(int tno, int pno,int sno,String writer, Date tdte,String state) {
	this.tno = tno;
	this.pno = pno;
	this.writer = writer;
	this.tdte = tdte;
	this.state = state;
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


}