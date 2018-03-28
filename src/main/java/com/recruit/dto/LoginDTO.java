package com.recruit.dto;

//문> LoginDTO는 화면에서 전달되는 데이터를 수집하는 용도
public class LoginDTO {
	private String id;
	private String pw;
	private String pname;
	private String cname;
	private String email;
	private String index; //개인로그인과 기업로그인을 비교하기 위해 들어간 변수
	private boolean useCookie;
	private String pw2;

	
	public String getPw2() {
		return pw2;
	}
	public void setPw2(String pw2) {
		this.pw2 = pw2;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIndex() {
		return index;
	}
	public void setIndex(String index) {
		this.index = index;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	@Override
	public String toString() {
		return "LoginDTO [id=" + id + ", pw=" + pw + ", pname=" + pname + ", cname=" + cname + ", email=" + email
				+ ", index=" + index + ", useCookie=" + useCookie + ", pw2=" + pw2 + "]";
	}
	
	
	
	
}