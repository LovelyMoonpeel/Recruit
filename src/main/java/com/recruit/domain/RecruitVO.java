package com.recruit.domain;

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
	private String acceptmethod;
	private String recruitform;
	private String regdate;
	private int viewcnt;
	private String recruitstate;
	private String week;
	private String applynum;
	private int rownum;
	private String btnstate;
	


	@Override
	public String toString() {
		return "RecruitVO [bno=" + bno + ", title=" + title + ", cid=" + cid + ", jobgroupid=" + jobgroupid
				+ ", jobgroupid2=" + jobgroupid2 + ", rgbid=" + rgbid + ", rgsid=" + rgsid + ", jobdesc=" + jobdesc
				+ ", recruitnum=" + recruitnum + ", employstatusid=" + employstatusid + ", salaryid=" + salaryid
				+ ", edu=" + edu + ", exp=" + exp + ", adddesc=" + adddesc + ", period=" + period + ", acceptmethod="
				+ acceptmethod + ", recruitform=" + recruitform + ", regdate=" + regdate + ", viewcnt=" + viewcnt
				+ ", recruitstate=" + recruitstate + ", week=" + week + ", applynum=" + applynum + ", rownum=" + rownum
				+ ", btnstate=" + btnstate + "]";
	}

	public String getBtnstate() {
		return btnstate;
	}

	public void setBtnstate(String btnstate) {
		this.btnstate = btnstate;
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
	
	// private int jobgroupid2; // merge

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
		System.out.println("야야get Period");
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

	// Merge
	// public int getJobgroupid2() {
	// return jobgroupid2;
	// }
	//
	// public void setJobgroupid2(int jobgroupid2) {
	// this.jobgroupid2 = jobgroupid2;
	// }

	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((acceptmethod == null) ? 0 : acceptmethod.hashCode());
		result = prime * result + ((adddesc == null) ? 0 : adddesc.hashCode());
		result = prime * result + bno;
		result = prime * result + ((cid == null) ? 0 : cid.hashCode());
		result = prime * result + ((edu == null) ? 0 : edu.hashCode());
		result = prime * result + ((employstatusid == null) ? 0 : employstatusid.hashCode());
		result = prime * result + ((exp == null) ? 0 : exp.hashCode());
		result = prime * result + ((jobdesc == null) ? 0 : jobdesc.hashCode());
		result = prime * result + ((jobgroupid == null) ? 0 : jobgroupid.hashCode());
		result = prime * result + ((jobgroupid2 == null) ? 0 : jobgroupid2.hashCode());
		result = prime * result + ((period == null) ? 0 : period.hashCode());
		result = prime * result + ((recruitform == null) ? 0 : recruitform.hashCode());
		result = prime * result + recruitnum;
		result = prime * result + ((regdate == null) ? 0 : regdate.hashCode());
		result = prime * result + ((rgbid == null) ? 0 : rgbid.hashCode());
		result = prime * result + ((rgsid == null) ? 0 : rgsid.hashCode());
		result = prime * result + ((salaryid == null) ? 0 : salaryid.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + viewcnt;
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
		if (acceptmethod == null) {
			if (other.acceptmethod != null)
				return false;
		} else if (!acceptmethod.equals(other.acceptmethod))
			return false;
		if (adddesc == null) {
			if (other.adddesc != null)
				return false;
		} else if (!adddesc.equals(other.adddesc))
			return false;
		if (bno != other.bno)
			return false;
		if (cid == null) {
			if (other.cid != null)
				return false;
		} else if (!cid.equals(other.cid))
			return false;
		if (edu == null) {
			if (other.edu != null)
				return false;
		} else if (!edu.equals(other.edu))
			return false;
		if (employstatusid == null) {
			if (other.employstatusid != null)
				return false;
		} else if (!employstatusid.equals(other.employstatusid))
			return false;
		if (exp == null) {
			if (other.exp != null)
				return false;
		} else if (!exp.equals(other.exp))
			return false;
		if (jobdesc == null) {
			if (other.jobdesc != null)
				return false;
		} else if (!jobdesc.equals(other.jobdesc))
			return false;
		if (jobgroupid == null) {
			if (other.jobgroupid != null)
				return false;
		} else if (!jobgroupid.equals(other.jobgroupid))
			return false;
		if (jobgroupid2 == null) {
			if (other.jobgroupid2 != null)
				return false;
		} else if (!jobgroupid2.equals(other.jobgroupid2))
			return false;
		if (period == null) {
			if (other.period != null)
				return false;
		} else if (!period.equals(other.period))
			return false;
		if (recruitform == null) {
			if (other.recruitform != null)
				return false;
		} else if (!recruitform.equals(other.recruitform))
			return false;
		if (recruitnum != other.recruitnum)
			return false;
		if (regdate == null) {
			if (other.regdate != null)
				return false;
		} else if (!regdate.equals(other.regdate))
			return false;
		if (rgbid == null) {
			if (other.rgbid != null)
				return false;
		} else if (!rgbid.equals(other.rgbid))
			return false;
		if (rgsid == null) {
			if (other.rgsid != null)
				return false;
		} else if (!rgsid.equals(other.rgsid))
			return false;
		if (salaryid == null) {
			if (other.salaryid != null)
				return false;
		} else if (!salaryid.equals(other.salaryid))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (viewcnt != other.viewcnt)
			return false;
		return true;
	}
}