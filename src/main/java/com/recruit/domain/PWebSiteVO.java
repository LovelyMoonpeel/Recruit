package com.recruit.domain;

public class PWebSiteVO {

	private int id;
	private int rid;
	private String title;
	private String webadd;
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
	public String getWebadd() {
		return webadd;
	}
	public void setWebadd(String webadd) {
		this.webadd = webadd;
	}
	
	@Override
	public String toString() {
		return "PWebSiteVO [id=" + id + ", rid=" + rid + ", title=" + title + ", webadd=" + webadd + "]";
	}	
	
}
