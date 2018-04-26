package com.recruit.domain;

public class PApplyVO {
	private String rsno;
	private String rcno;
	private String pid;//알림 보낼 때 개인아이디
	private String readornot;
	//소연 readornot 추가
	private int bno;
	private String userid;//알림 보낼 때 회사아이디
	private String title;
	private String address;
	private String postcode;
	private String coverletter;
	
	private String img;
	private String regdate;
	
	public String getRsno() {
		return rsno;
	}
	public void setRsno(String rsno) {
		this.rsno = rsno;
	}
	public String getRcno() {
		return rcno;
	}
	public void setRcno(String rcno) {
		this.rcno = rcno;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getReadornot() {
		return readornot;
	}
	public void setReadornot(String readornot) {
		this.readornot = readornot;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getCoverletter() {
		return coverletter;
	}
	public void setCoverletter(String coverletter) {
		this.coverletter = coverletter;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "PApplyVO [rsno=" + rsno + ", rcno=" + rcno + ", pid=" + pid + ", readornot=" + readornot + ", bno="
				+ bno + ", userid=" + userid + ", title=" + title + ", address=" + address + ", postcode=" + postcode
				+ ", coverletter=" + coverletter + ", img=" + img + ", regdate=" + regdate + "]";
	}
}