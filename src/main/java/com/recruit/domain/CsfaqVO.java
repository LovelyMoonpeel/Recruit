package com.recruit.domain;

public class CsfaqVO {

	public Integer bno;
	public String title;
	public String content;

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "CsfaqVO [bno=" + bno + ", title=" + title + ", content=" + content + "]";
	}
}