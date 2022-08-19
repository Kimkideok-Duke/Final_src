package PMS.vo;

public class TimeResult {
private int tno; 
private String tmResult;
public TimeResult() {
	super();
	// TODO Auto-generated constructor stub
}
public TimeResult(int tno, String tmResult) {
	this.tno = tno;
	this.tmResult = tmResult;
}
public int getTno() {
	return tno;
}
public void setTno(int tno) {
	this.tno = tno;
}
public String getTmResult() {
	return tmResult;
}
public void setTmResult(String tmResult) {
	this.tmResult = tmResult;
}

}
