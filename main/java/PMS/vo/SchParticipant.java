package PMS.vo;

public class SchParticipant {
	private String userno;
	private int sno;
	private int pno;
	public SchParticipant() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SchParticipant(String userno, int sno, int pno) {
		super();
		this.userno = userno;
		this.sno = sno;
		this.pno = pno;
	}
	public SchParticipant(String userno, int sno) {
		super();
		this.userno = userno;
		this.sno = sno;
	}
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
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
	
}
