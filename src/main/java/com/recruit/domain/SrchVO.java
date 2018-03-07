package com.recruit.domain;

public class SrchVO {

	private String stype;	// search type
	private String sdesc;	// search describe

	public String getSdesc() {
		return sdesc;
	}

	public void setSdesc(String sdesc) {
		this.sdesc = sdesc;
	}

	public String getStype() {
		return stype;
	}

	public void setStype(String stype) {
		this.stype = stype;
	}

	@Override
	public String toString() {
		return "SrchVO [stype=" + stype + ", sdesc=" + sdesc + "]";
	}
}
