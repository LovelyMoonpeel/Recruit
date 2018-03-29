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
	private String preadornot;
	//소연 추가 preadornot

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

	public String getPreadornot() {
		return preadornot;
	}

	public void setPreadornot(String preadornot) {
		this.preadornot = preadornot;
	}
	
	@Override
	public String toString() {
		return "ResumeVO [bno=" + bno + ", userid=" + userid + ", title=" + title + ", address=" + address
				+ ", postcode=" + postcode + ", coverletter=" + coverletter + ", jobstateid=" + jobstateid
				+ ", jobgroupid=" + jobgroupid + ", jobgroupid2=" + jobgroupid2 + ", rgbid=" + rgbid + ", rgsid="
				+ rgsid + ", employstatusid=" + employstatusid + ", salaryid=" + salaryid + ", img=" + img
				+ ", regdate=" + regdate + ", levelofeducation=" + levelofeducation + ", lastcareer=" + lastcareer
				+ ", preadornot=" + preadornot + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + bno;
		result = prime * result + ((coverletter == null) ? 0 : coverletter.hashCode());
		result = prime * result + ((employstatusid == null) ? 0 : employstatusid.hashCode());
		result = prime * result + ((img == null) ? 0 : img.hashCode());
		result = prime * result + ((jobgroupid == null) ? 0 : jobgroupid.hashCode());
		result = prime * result + ((jobgroupid2 == null) ? 0 : jobgroupid2.hashCode());
		result = prime * result + ((jobstateid == null) ? 0 : jobstateid.hashCode());
		result = prime * result + ((postcode == null) ? 0 : postcode.hashCode());
		result = prime * result + ((regdate == null) ? 0 : regdate.hashCode());
		result = prime * result + ((rgbid == null) ? 0 : rgbid.hashCode());
		result = prime * result + ((rgsid == null) ? 0 : rgsid.hashCode());
		result = prime * result + ((salaryid == null) ? 0 : salaryid.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((userid == null) ? 0 : userid.hashCode());
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
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (bno != other.bno)
			return false;
		if (coverletter == null) {
			if (other.coverletter != null)
				return false;
		} else if (!coverletter.equals(other.coverletter))
			return false;
		if (employstatusid == null) {
			if (other.employstatusid != null)
				return false;
		} else if (!employstatusid.equals(other.employstatusid))
			return false;
		if (img == null) {
			if (other.img != null)
				return false;
		} else if (!img.equals(other.img))
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
		if (jobstateid == null) {
			if (other.jobstateid != null)
				return false;
		} else if (!jobstateid.equals(other.jobstateid))
			return false;
		if (postcode == null) {
			if (other.postcode != null)
				return false;
		} else if (!postcode.equals(other.postcode))
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
		if (userid == null) {
			if (other.userid != null)
				return false;
		} else if (!userid.equals(other.userid))
			return false;
		return true;
	}
}