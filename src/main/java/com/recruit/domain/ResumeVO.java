package com.recruit.domain;

import java.util.List;

public class ResumeVO {

	private int bno;
	private String userid;
	private String title;
	private String address;
	private String postcode;
	private String coverletter;
	private int jobstateid;
	private int jobgroupid;
	private String rgbid;
	private int rgsid;
	private int employstatusid;
	private int salaryid;
	private String img;
	private String regdate;

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getCoverletter() {
		return coverletter;
	}

	public void setCoverletter(String coverletter) {
		this.coverletter = coverletter;
	}

	public int getJobstateid() {
		return jobstateid;
	}

	public void setJobstateid(int jobstateid) {
		this.jobstateid = jobstateid;
	}

	public int getJobgroupid() {
		return jobgroupid;
	}

	public void setJobgroupid(int jobgroupid) {
		this.jobgroupid = jobgroupid;
	}

	public String getRgbid() {
		return rgbid;
	}

	public void setRgbid(String rgbid) {
		this.rgbid = rgbid;
	}

	public int getRgsid() {
		return rgsid;
	}

	public void setRgsid(int rgsid) {
		this.rgsid = rgsid;
	}

	public int getEmploystatusid() {
		return employstatusid;
	}

	public void setEmploystatusid(int employstatusid) {
		this.employstatusid = employstatusid;
	}

	public int getSalaryid() {
		return salaryid;
	}

	public void setSalaryid(int salaryid) {
		this.salaryid = salaryid;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "ResumeVO [bno=" + bno + ", userid=" + userid + ", title=" + title + ", address=" + address
				+ ", postcode=" + postcode + ", coverletter=" + coverletter + ", jobstateid=" + jobstateid
				+ ", jobgroupid=" + jobgroupid + ", rgbid=" + rgbid + ", rgsid=" + rgsid + ", employstatusid="
				+ employstatusid + ", salaryid=" + salaryid + ", img=" + img + ", regdate=" + regdate + "]";
	}
}
