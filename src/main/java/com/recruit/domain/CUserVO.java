package com.recruit.domain;

public class CUserVO {

	private String id;
	private String pw;
	private String cname;
	private String pname;
	private String email;
	private String registnum;

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

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
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

	public String getRegistnum() {
		return registnum;
	}

	public void setRegistnum(String registnum) {
		this.registnum = registnum;
	}

	@Override
	public String toString() {
		return "CUserVO [id=" + id + ", pw=" + pw + ", cname=" + cname + ", pname=" + pname + ", email=" + email
				+ ", registnum=" + registnum + "]";
	}
}
