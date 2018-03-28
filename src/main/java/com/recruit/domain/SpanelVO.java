package com.recruit.domain;

public class SpanelVO implements Bnoble {

	private int bno;
	private String userid; // c.cid
	private String title;
	private String jobgroupid;
	private String jobgroupid2;
	private String rgbid;
	private String rgsid;
	private String employstatusid;
	private String edu; // p.levelofeducation
	private String exp; // p.lastcareer
	private String img; // c.tblcinfo.img

	// recruit
	private String cname; // c.tbluser.cname
	private String period;

	// resume
	private String pname; // p.tbluser.pname
	private String jobstateid;

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

	public String getEdu() {
		return edu;
	}

	public void setEdu(String edu) {
		this.edu = edu;
	}

	public String getExp() {
		return exp;
	}

	public void setExp(String exp) {
		this.exp = exp;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getJobstateid() {
		return jobstateid;
	}

	public void setJobstateid(String jobstateid) {
		this.jobstateid = jobstateid;
	}

	@Override
	public String toString() {
		return "SpanelVO [bno=" + bno + ", userid=" + userid + ", title=" + title + ", jobgroupid=" + jobgroupid
				+ ", jobgroupid2=" + jobgroupid2 + ", rgbid=" + rgbid + ", rgsid=" + rgsid + ", employstatusid="
				+ employstatusid + ", edu=" + edu + ", exp=" + exp + ", img=" + img + ", cname=" + cname + ", period="
				+ period + ", pname=" + pname + ", jobstateid=" + jobstateid + "]";
	}
}
