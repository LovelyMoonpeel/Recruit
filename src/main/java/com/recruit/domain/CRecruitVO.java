package com.recruit.domain;

public class CRecruitVO {
	int bno;
	String title;
	String cid;
	int jobgroupid;
	String rgbid;
	int rgsid;
	String jobdesc;
	int recruitnum;
	int employstatusid;
	int salaryid;
	int edu;
	int exp;
	String adddesc;
	String period;
	String acceptmethod;
	String recruitform;
	String regdate;
	int viewcnt;
	
	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
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

	public String getJobdesc() {
		return jobdesc;
	}

	public void setJobdesc(String jobdesc) {
		this.jobdesc = jobdesc;
	}

	public int getRecruitnum() {
		return recruitnum;
	}

	public void setRecruitnum(int recruitnum) {
		this.recruitnum = recruitnum;
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

	public int getEdu() {
		return edu;
	}

	public void setEdu(int edu) {
		this.edu = edu;
	}

	public int getExp() {
		return exp;
	}

	public void setExp(int exp) {
		this.exp = exp;
	}

	public String getAdddesc() {
		return adddesc;
	}

	public void setAdddesc(String adddesc) {
		this.adddesc = adddesc;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getAcceptmethod() {
		return acceptmethod;
	}

	public void setAcceptmethod(String acceptmethod) {
		this.acceptmethod = acceptmethod;
	}

	public String getRecruitform() {
		return recruitform;
	}

	public void setRecruitform(String recruitform) {
		this.recruitform = recruitform;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	@Override
	public String toString() {
		return "CRecruitVO [bno=" + bno + ", title=" + title + ", cid=" + cid + ", jobgroupid=" + jobgroupid
				+ ", rgbid=" + rgbid + ", rgsid=" + rgsid + ", jobdesc=" + jobdesc + ", recruitnum=" + recruitnum
				+ ", employstatusid=" + employstatusid + ", salaryid=" + salaryid + ", edu=" + edu + ", exp=" + exp
				+ ", adddesc=" + adddesc + ", period=" + period + ", acceptmethod=" + acceptmethod + ", recruitform="
				+ recruitform + ", regdate=" + regdate + ", viewcnt=" + viewcnt + "]";
	}
}
