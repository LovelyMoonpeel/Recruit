package com.recruit.domain;

public class PreferenceVO {

	private String userid;
	private String job;
	private String region;
	private String employstatus;
	private String levelofeducation;
	private String lastcareer;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getjob() {
		return job;
	}
	public void setjob(String job) {
		this.job = job;
	}
	public String getregion() {
		return region;
	}
	public void setregion(String region) {
		this.region = region;
	}
	public String getemploystatus() {
		return employstatus;
	}
	public void setemploystatus(String employstatus) {
		this.employstatus = employstatus;
	}
	public String getlevelofeducation() {
		return levelofeducation;
	}
	public void setlevelofeducation(String levelofeducation) {
		this.levelofeducation = levelofeducation;
	}
	public String getlastcareer() {
		return lastcareer;
	}
	public void setlastcareer(String lastcareer) {
		this.lastcareer = lastcareer;
	}
	@Override
	public String toString() {
		return "PreferenceVO [userid=" + userid + ", job=" + job + ", region=" + region
				+ ", employstatus=" + employstatus + ", levelofeducation=" + levelofeducation
				+ ", lastcareer=" + lastcareer + "]";
	}
	
}
