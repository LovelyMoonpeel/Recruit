package com.recruit.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class RecruitVO implements Bnoble {

	private int bno;
	private String title;
	private String cid;
	private String jobgroupid;
	private String jobgroupid2;
	private String rgbid;
	private String rgsid;
	private String jobdesc;
	private int recruitnum;
	private String employstatusid;
	private String salaryid;
	private String edu;
	private String exp;
	private String adddesc;
	private String period;
	private String periodstart;
	private String state;
	private String acceptmethod;
	private String recruitform;
	private String regdate;
	private int viewcnt;
	private String recruitstate;
	private String week;
	private String applynum;
	private int rownum;
	private String btnstate;
	private String pname;
	private String lat;
	private String lng;
	private String qcnt;
	private String interestcnt;
	private String applycnt;
	private String dday;
	private String endday;
	
















	@Override
	public String toString() {
		return "RecruitVO [bno=" + bno + ", title=" + title + ", cid=" + cid + ", jobgroupid=" + jobgroupid
				+ ", jobgroupid2=" + jobgroupid2 + ", rgbid=" + rgbid + ", rgsid=" + rgsid + ", jobdesc=" + jobdesc
				+ ", recruitnum=" + recruitnum + ", employstatusid=" + employstatusid + ", salaryid=" + salaryid
				+ ", edu=" + edu + ", exp=" + exp + ", adddesc=" + adddesc + ", period=" + period + ", periodstart="
				+ periodstart + ", state=" + state + ", acceptmethod=" + acceptmethod + ", recruitform=" + recruitform
				+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", recruitstate=" + recruitstate + ", week=" + week
				+ ", applynum=" + applynum + ", rownum=" + rownum + ", btnstate=" + btnstate + ", pname=" + pname
				+ ", lat=" + lat + ", lng=" + lng + ", qcnt=" + qcnt + ", interestcnt=" + interestcnt + ", applycnt="
				+ applycnt + ", dday=" + dday + ", endday=" + endday + "]";
	}

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

	public String getPeriodstart() {
		return periodstart;
	}

	public void setPeriodstart(String periodstart) {
		this.periodstart = periodstart;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
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

	public String getRecruitstate() {
		return recruitstate;
	}

	public void setRecruitstate(String recruitstate) {
		this.recruitstate = recruitstate;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public String getApplynum() {
		return applynum;
	}

	public void setApplynum(String applynum) {
		this.applynum = applynum;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public String getBtnstate() {
		return btnstate;
	}

	public void setBtnstate(String btnstate) {
		this.btnstate = btnstate;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getQcnt() {
		return qcnt;
	}

	public void setQcnt(String qcnt) {
		this.qcnt = qcnt;
	}

	public String getInterestcnt() {
		return interestcnt;
	}

	public void setInterestcnt(String interestcnt) {
		this.interestcnt = interestcnt;
	}

	public String getApplycnt() {
		return applycnt;
	}

	public void setApplycnt(String applycnt) {
		this.applycnt = applycnt;
	}

	public String getDday() {
		return dday;
	}

	public void setDday(String dday) {
		this.dday = dday;
	}

	public String getEndday() {
		return endday;
	}

	public void setEndday(String endday) {
		this.endday = endday;
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
		RecruitVO other = (RecruitVO) obj;
		if (bno != other.bno)
			return false;
		return true;
	}
}