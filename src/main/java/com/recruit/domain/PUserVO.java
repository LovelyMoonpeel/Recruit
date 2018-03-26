package com.recruit.domain;

public class PUserVO {

	private String id;
	private String pw;
	private String npw;
	private String pname;
	private String email;
	private String birth;

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

	public String getNpw() {
		return npw;
	}

	public void setNpw(String npw) {
		this.npw = npw;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return "PUserVO [id=" + id + ", pw=" + pw + ", npw=" + npw + ", pname=" + pname + ", email=" + email
				+ ", birth=" + birth + "]";
	}

}
