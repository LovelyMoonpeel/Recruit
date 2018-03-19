package com.recruit.domain;

public class SpanelVO implements Bnoble {
	// ResumeVO
	private int bno;
	private String userid;
	private String title;
	private String jobstateid;
	private String jobgroupid;
	private String jobgroupid2;
	private String rgbid;
	private String rgsid;
	private String img;

	// 개인회원용
	private String pname;

	// RecruitVO
	private String cid;
	private String edu;
	private String exp;
	private String period;

	// 기업회원용
	private String cname;

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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
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

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	@Override
	public String toString() {
		return "SpanelVO [bno=" + bno + ", userid=" + userid + ", title=" + title + ", jobstateid=" + jobstateid
				+ ", jobgroupid=" + jobgroupid + ", jobgroupid2=" + jobgroupid2 + ", rgbid=" + rgbid + ", rgsid="
				+ rgsid + ", img=" + img + ", pname=" + pname + ", cid=" + cid + ", edu=" + edu + ", exp=" + exp
				+ ", period=" + period + ", cname=" + cname + "]";
	}
}
