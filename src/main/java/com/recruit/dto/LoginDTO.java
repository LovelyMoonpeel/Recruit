package com.recruit.dto;

public class LoginDTO {
	private String id;
	private String pw;
	private boolean useCookie;
	
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
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	@Override
	public String toString() {
		return "LoginDTO [id=" + id + ", pw=" + pw + ", useCookie=" + useCookie + "]";
	}
	
	
}

//630
/*
화면에서 전달하는 데이터를 수집하는 용도로 사용
*/
