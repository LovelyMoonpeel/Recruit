package com.recruit.domain;

public class PInterestJobVO {

	private String userid;
	private Integer rcbno;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Integer getRcbno() {
		return rcbno;
	}
	public void setRcbno(Integer rcbno) {
		this.rcbno = rcbno;
	}
	@Override
	public String toString() {
		return "PInterestJobVO [userid=" + userid + ", rcbno=" + rcbno + "]";
	}
}
