package com.recruit.domain;

public class ResumeVO implements Bnoble {

	private int bno;
	private String userid;
	private String title;
	private String address;
	private String postcode;
	private String coverletter;
	private String jobstateid;
	private String jobgroupid;
	private String jobgroupid2;
	private String rgbid;
	private String rgsid;
	private String employstatusid;
	private String salaryid;
	private String img;
	private String regdate;
	private String levelofeducation;
	private String lastcareer;
	private String publicornot;
	//소연 publicornot 추가
	private String preadornot;
	private String extracolumn;
	//소연 추가

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

	public String getJobgroupid2() {
		return jobgroupid2;
	}

	public void setJobgroupid2(String jobgroupid2) {
		this.jobgroupid2 = jobgroupid2;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getLevelofeducation() {
		return levelofeducation;
	}

	public void setLevelofeducation(String levelofeducation) {
		this.levelofeducation = levelofeducation;
	}

	public String getLastcareer() {
		return lastcareer;
	}

	public void setLastcareer(String lastcareer) {
		this.lastcareer = lastcareer;
	}

	public String getPublicornot() {
		return publicornot;
	}

	public void setPublicornot(String publicornot) {
		this.publicornot = publicornot;
	}

	public String getPreadornot() {
		return preadornot;
	}

	public void setPreadornot(String preadornot) {
		this.preadornot = preadornot;
	}

	public String getExtracolumn() {
		return extracolumn;
	}

	public void setExtracolumn(String extracolumn) {
		this.extracolumn = extracolumn;
	}
	
	@Override
	public String toString() {
		return "ResumeVO [bno=" + bno + ", userid=" + userid + ", title=" + title + ", address=" + address
				+ ", postcode=" + postcode + ", coverletter=" + coverletter + ", jobstateid=" + jobstateid
				+ ", jobgroupid=" + jobgroupid + ", jobgroupid2=" + jobgroupid2 + ", rgbid=" + rgbid + ", rgsid="
				+ rgsid + ", employstatusid=" + employstatusid + ", salaryid=" + salaryid + ", img=" + img
				+ ", regdate=" + regdate + ", levelofeducation=" + levelofeducation + ", lastcareer=" + lastcareer
				+ ", publicornot=" + publicornot + ", preadornot=" + preadornot + ", extracolumn=" + extracolumn + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + bno;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ResumeVO other = (ResumeVO) obj;
		if (bno != other.bno)
			return false;
		return true;
	}
}