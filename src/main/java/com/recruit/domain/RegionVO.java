package com.recruit.domain;

public class RegionVO {

	private String rgbid;
	private String rgbname;
	private int rgsid;
	private String rgsname;

	public String getRgbid() {
		return rgbid;
	}

	public void setRgbid(String rgbid) {
		this.rgbid = rgbid;
	}

	public String getRgbname() {
		return rgbname;
	}

	public void setRgbname(String rgbname) {
		this.rgbname = rgbname;
	}

	public int getRgsid() {
		return rgsid;
	}

	public void setRgsid(int rgsid) {
		this.rgsid = rgsid;
	}

	public String getRgsname() {
		return rgsname;
	}

	public void setRgsname(String rgsname) {
		this.rgsname = rgsname;
	}

	@Override
	public String toString() {
		return "RegionVO [rgbid=" + rgbid + ", rgbname=" + rgbname + ", rgsid=" + rgsid + ", rgsname=" + rgsname + "]";
	}
}
