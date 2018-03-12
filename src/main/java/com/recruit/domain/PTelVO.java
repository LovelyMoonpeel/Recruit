package com.recruit.domain;

public class PTelVO {

	private int id;
	private int rid;
	private String title;
	private String tel;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "PTelVO [id=" + id + ", rid=" + rid + ", title=" + title + ", tel=" + tel + "]";
	}	
	
}
