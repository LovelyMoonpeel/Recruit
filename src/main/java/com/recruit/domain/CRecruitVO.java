package com.recruit.domain;

public class CRecruitVO {
	public String bno;
	//안소연 bno로 바꿈
	private String title;
	private String cid;
	private int jobgroupid;
	private String rgbid;
	public int rgsid;
	private String jobdesc;
	private String recruitnum;
	private int employstatusid;
	private int salaryid;
	private int edu;
	private int exp;
	private String addesc;
	private String period;
	private String acceptmethod;
	private String recruitform;
	private String regdate;
	private int viewcnt;
	private String creadornot;
	//소연 creadornot 추가
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
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
	public String getRecruitnum() {
		return recruitnum;
	}
	public void setRecruitnum(String recruitnum) {
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
	public String getAddesc() {
		return addesc;
	}
	public void setAddesc(String addesc) {
		this.addesc = addesc;
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
	public String getCreadornot() {
		return creadornot;
	}
	public void setCreadornot(String creadornot) {
		this.creadornot = creadornot;
	}
	@Override
	public String toString() {
		return "CRecruitVO [bno=" + bno + ", title=" + title + ", cid=" + cid + ", jobgroupid=" + jobgroupid
				+ ", rgbid=" + rgbid + ", rgsid=" + rgsid + ", jobdesc=" + jobdesc + ", recruitnum=" + recruitnum
				+ ", employstatusid=" + employstatusid + ", salaryid=" + salaryid + ", edu=" + edu + ", exp=" + exp
				+ ", addesc=" + addesc + ", period=" + period + ", acceptmethod=" + acceptmethod + ", recruitform="
				+ recruitform + ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", creadornot=" + creadornot + "]";
	}
	
}
