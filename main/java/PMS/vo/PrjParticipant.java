package PMS.vo;

public class PrjParticipant {
	private String userno;
	private int pno;
	public PrjParticipant() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PrjParticipant(String userno, int pno) {
		super();
		this.userno = userno;
		this.pno = pno;
	}
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	
}
