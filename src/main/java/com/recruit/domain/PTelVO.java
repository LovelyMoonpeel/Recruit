package com.recruit.domain;

import java.util.List;

public class PTelVO {

	private int id;
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
		return "PTelVO [id=" + id + ", rid=" + rid + ", teltitle=" + teltitle + ", tel=" + tel + "]";
	}
}
