package PMS.vo;

import java.util.Date;
// PMS.vo.Account
public class Account {
	private String userno;
	private String pw;
	private String name;
	private String email;
	private String dept;
	private String position;
	private String address;
	private String hpnum;
	private Date birthdate;
	private String birthdateS;
	private Date joindate;
	private String joindateS;
	private String auth;
	public Account() {
		// TODO Auto-generated constructor stub
	}
	public Account(String userno, String pw, String name, String email, String dept, String position, String address,
			String hpnum, Date birthdate, Date joindate, String auth) {
		this.userno = userno;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.dept = dept;
		this.position = position;
		this.address = address;
		this.hpnum = hpnum;
		this.birthdate = birthdate;
		this.joindate = joindate;
		this.auth = auth;
	}
	public Account(String userno, String pw, String name, String email, String dept, String position, String address,
			String hpnum, String birthdateS, String joindateS, String auth) {
		this.userno = userno;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.dept = dept;
		this.position = position;
		this.address = address;
		this.hpnum = hpnum;
		this.birthdateS = birthdateS;
		this.joindateS = joindateS;
		this.auth = auth;
	}
	
	public Account(String userno, String pw) {
		this.userno = userno;
		this.pw = pw;
	}
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getHpnum() {
		return hpnum;
	}
	public void setHpnum(String hpnum) {
		this.hpnum = hpnum;
	}
	public Date getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}
	public String getBirthdateS() {
		return birthdateS;
	}
	public void setBirthdateS(String birthdateS) {
		this.birthdateS = birthdateS;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public String getJoindateS() {
		return joindateS;
	}
	public void setJoindateS(String joindateS) {
		this.joindateS = joindateS;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	
}
