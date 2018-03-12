package com.recruit.domain;

public class CsqnaVO {

	private Integer bno;
	private String title;
	private String user;
	private String content;
	private String bpw;
	private String regdate;
	private Integer viewcnt;
	private Integer reply;

	public Integer getBno() {
		return bno;
	}

	public void setBno(Integer bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBpw() {
		return bpw;
	}

	public void setBpw(String bpw) {
		this.bpw = bpw;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public Integer getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(Integer viewcnt) {
		this.viewcnt = viewcnt;
	}

	public Integer getReply() {
		return reply;
	}

	public void setReply(Integer reply) {
		this.reply = reply;
	}

	@Override
	public String toString() {
		return "CsqnaVO [bno=" + bno + ", title=" + title + ", user=" + user + ", content=" + content + ", bpw=" + bpw
				+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", reply=" + reply + "]";
	}

}