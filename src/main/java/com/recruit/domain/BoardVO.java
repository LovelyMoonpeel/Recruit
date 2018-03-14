package com.recruit.domain;

//3.14 문필 전체 확인
public class BoardVO {
	
	private String id;
	private String pw;
	private String cname;
	private String pname;
	private String email;
	private String registnum;
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
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	@Override
	public String toString() {
		return "BoardVO [id=" + id + ", pw=" + pw + ", cname=" + cname + ", pname=" + pname + ", email=" + email
				+ ", registnum=" + registnum + ", birth=" + birth + "]";
	}
	
}

//629
/*
���ǿ� ������ UserVOŬ������ ����
*/

