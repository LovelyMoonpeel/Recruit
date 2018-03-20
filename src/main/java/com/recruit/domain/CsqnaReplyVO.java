package com.recruit.domain;

public class CsqnaReplyVO {

	private Integer rno;
	private Integer bno;
	private String content;
	private String regdate;
	public Integer getRno() {
		return rno;
	}
	public void setRno(Integer rno) {
		this.rno = rno;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "CsqnaReplyVO [rno=" + rno + ", bno=" + bno + ", content=" + content + ", regdate=" + regdate + "]";
	}
	
	
}
