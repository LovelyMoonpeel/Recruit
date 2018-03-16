package com.recruit.domain;

import java.util.List;

public class PWebSiteVO {

	private int id;
	private int rid;
	private String webtitle;
	private String webadd;
	private List<PWebSiteVO> pwebsitesvolist;
	
	public List<PWebSiteVO> getPwebsitesvolist() {
		return pwebsitesvolist;
	}
	public void setPwebsitesvolist(List<PWebSiteVO> pwebsitesvolist) {
		this.pwebsitesvolist = pwebsitesvolist;
	}
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
	public String getWebtitle() {
		return webtitle;
	}
	public void setWebtitle(String webtitle) {
		this.webtitle = webtitle;
	}
	public String getWebadd() {
		return webadd;
	}
	public void setWebadd(String webadd) {
		this.webadd = webadd;
	}
	
	@Override
	public String toString() {
		return "PWebSiteVO [id=" + id + ", rid=" + rid + ", webtitle=" + webtitle + ", webadd=" + webadd + "]";
	}	
	
}
