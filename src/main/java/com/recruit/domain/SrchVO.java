package com.recruit.domain;

public class SrchVO {

	private String stype; // search type
	private String sdesc; // search describe
	private String skeyword; // search keyword
	private String sfilter; // search filter

	public String getStype() {
		return stype;
	}

	public void setStype(String stype) {
		this.stype = stype;
	}

	public String getSdesc() {
		return sdesc;
	}

	public void setSdesc(String sdesc) {
		this.sdesc = sdesc;
	}

	public String getSkeyword() {
		return skeyword;
	}

	public void setSkeyword(String skeyword) {
		this.skeyword = skeyword;
	}

	public String getSfilter() {
		return sfilter;
	}

	public void setSfilter(String sfilter) {
		this.sfilter = sfilter;
	}

	@Override
	public String toString() {
		return "SrchVO [stype=" + stype + ", sdesc=" + sdesc + ", skeyword=" + skeyword + ", sfilter=" + sfilter + "]";
	}
}
