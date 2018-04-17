package com.recruit.domain;

public class PreferenceVO {

	private String id;
	private String pref_job;
	private String pref_region;
	private String pref_employstatus;
	private String pref_levelofeducation;
	private String pref_lastcareer;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPref_job() {
		return pref_job;
	}
	public void setPref_job(String pref_job) {
		this.pref_job = pref_job;
	}
	public String getPref_region() {
		return pref_region;
	}
	public void setPref_region(String pref_region) {
		this.pref_region = pref_region;
	}
	public String getPref_employstatus() {
		return pref_employstatus;
	}
	public void setPref_employstatus(String pref_employstatus) {
		this.pref_employstatus = pref_employstatus;
	}
	public String getPref_levelofeducation() {
		return pref_levelofeducation;
	}
	public void setPref_levelofeducation(String pref_levelofeducation) {
		this.pref_levelofeducation = pref_levelofeducation;
	}
	public String getPref_lastcareer() {
		return pref_lastcareer;
	}
	public void setPref_lastcareer(String pref_lastcareer) {
		this.pref_lastcareer = pref_lastcareer;
	}
	
	@Override
	public String toString() {
		return "PreferenceVO [id=" + id + ", pref_job=" + pref_job + ", pref_region=" + pref_region
				+ ", pref_employstatus=" + pref_employstatus + ", pref_levelofeducation=" + pref_levelofeducation
				+ ", pref_lastcareer=" + pref_lastcareer + "]";
	}
}
