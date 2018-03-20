package com.recruit.dto;

//문> LoginDTO는 화면에서 전달되는 데이터를 수집하는 용도
public class LoginDTO {
	private String id;
	private String pw;
	private String index;
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
		return "LoginDTO [id=" + id + ", pw=" + pw + ", index=" + index + ", useCookie=" + useCookie + "]";
	}
	

	
	
}