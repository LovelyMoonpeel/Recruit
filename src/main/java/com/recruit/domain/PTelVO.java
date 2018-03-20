package com.recruit.domain;

import java.util.List;

public class PTelVO {

	private int telid;
	private int rid;
	private String teltitle;
	private String tel;
	private List<PTelVO> ptelvolist;
	
	public List<PTelVO> getPtelvolist() {
		return ptelvolist;
	}
	public void setPtelvolist(List<PTelVO> ptelvolist) {
		this.ptelvolist = ptelvolist;
	}
	public int getTelid() {
		return telid;
	}
	public void setTelid(int telid) {
		this.telid = telid;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getTeltitle() {
		return teltitle;
	}
	public void setTeltitle(String teltitle) {
		this.teltitle = teltitle;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "PTelVO [telid=" + telid + ", rid=" + rid + ", teltitle=" + teltitle + ", tel=" + tel + "]";
	}
}
