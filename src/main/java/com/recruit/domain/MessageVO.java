package com.recruit.domain;

public class MessageVO {

	private String bno;
	private String userid;
	private String message;
	private String mreadornot;
	
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getMreadornot() {
		return mreadornot;
	}
	public void setMreadornot(String mreadornot) {
		this.mreadornot = mreadornot;
	}
	@Override
	public String toString() {
		return "MessageVO [bno=" + bno + ", userid=" + userid + ", message=" + message + ", mreadornot=" + mreadornot
				+ "]";
	}
}
