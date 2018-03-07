package com.recruit.domain;

public class AdminResumeVO {

	private Integer bno;
	private String id;
	private String title;
	private String address;
	private String postcode;
	private String coverletter;
	private String jobstateid;
	private String jobgroupid;
	private String rgbid;
	private String rgsid;
	private String employstatusid;
	private String salaryid;
	private String img;

	public Integer getBno() {
		return bno;
	}

	public void setBno(Integer bno) {
		this.bno = bno;
	}

	public String getUserid() {
		return id;
	}

	public void setUserid(String id) {
		this.id = id;
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

	public String getJobstateid() {
		return jobstateid;
	}

	public void setJobstateid(String jobstateid) {
		this.jobstateid = jobstateid;
	}

	public String getJobgroupid() {
		return jobgroupid;
	}

	public void setJobgroupid(String jobgroupid) {
		this.jobgroupid = jobgroupid;
	}

	public String getRgbid() {
		return rgbid;
	}

	public void setRgbid(String rgbid) {
		this.rgbid = rgbid;
	}

	public String getRgsid() {
		return rgsid;
	}

	public void setRgsid(String rgsid) {
		this.rgsid = rgsid;
	}

	public String getEmploystatusid() {
		return employstatusid;
	}

	public void setEmploystatusid(String employstatusid) {
		this.employstatusid = employstatusid;
	}

	public String getSalaryid() {
		return salaryid;
	}

	public void setSalaryid(String salaryid) {
		this.salaryid = salaryid;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "ResumeVO [bno=" + bno + ", id=" + id + ", title=" + title + ", address=" + address + ", postcode="
				+ postcode + ", coverletter=" + coverletter + ", jobstateid=" + jobstateid + ", jobgroupid="
				+ jobgroupid + ", rgbid=" + rgbid + ", rgsid=" + rgsid + ", employstatusid=" + employstatusid
				+ ", salaryid=" + salaryid + ", img=" + img + "]";
	}

}