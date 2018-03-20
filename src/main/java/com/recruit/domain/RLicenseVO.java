package com.recruit.domain;

import java.util.List;

public class RLicenseVO {
	
	private int licenseid;
	private int rid;
	private String licensename;
	private String publeoffice;
	private String acquidate;
	private List<RLicenseVO> rlicensevolist;
	
	public List<RLicenseVO> getRlicensevolist() {
		return rlicensevolist;
	}
	public void setRlicensevolist(List<RLicenseVO> rlicensevolist) {
		this.rlicensevolist = rlicensevolist;
	}
	public int getLicenseid() {
		return licenseid;
	}
	public void setLicenseid(int licenseid) {
		this.licenseid = licenseid;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getLicensename() {
		return licensename;
	}
	public void setLicensename(String licensename) {
		this.licensename = licensename;
	}
	public String getPubleoffice() {
		return publeoffice;
	}
	public void setPubleoffice(String publeoffice) {
		this.publeoffice = publeoffice;
	}
	public String getAcquidate() {
		return acquidate;
	}
	public void setAcquidate(String acquidate) {
		this.acquidate = acquidate;
	}
	@Override
	public String toString() {
		return "RLicenseVO [licenseid=" + licenseid + ", rid=" + rid + ", licensename=" + licensename + ", publeoffice=" + publeoffice
				+ ", acquidate=" + acquidate + "]";
	}	
	
}
