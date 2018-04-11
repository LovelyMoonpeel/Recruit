package com.recruit.domain;

public class PreferenceVO {

	private String userid;
	private String prefjob;
	private String prefregion;
	private String prefemploystatus;
	private String preflevelofeducation;
	private String preflastcareer;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPrefjob() {
		return prefjob;
	}
	public void setPrefjob(String prefjob) {
		this.prefjob = prefjob;
	}
	public String getPrefregion() {
		return prefregion;
	}
	public void setPrefregion(String prefregion) {
		this.prefregion = prefregion;
	}
	public String getPrefemploystatus() {
		return prefemploystatus;
	}
	public void setPrefemploystatus(String prefemploystatus) {
		this.prefemploystatus = prefemploystatus;
	}
	public String getPreflevelofeducation() {
		return preflevelofeducation;
	}
	public void setPreflevelofeducation(String preflevelofeducation) {
		this.preflevelofeducation = preflevelofeducation;
	}
	public String getPreflastcareer() {
		return preflastcareer;
	}
	public void setPreflastcareer(String preflastcareer) {
		this.preflastcareer = preflastcareer;
	}
	@Override
	public String toString() {
		return "PreferenceVO [userid=" + userid + ", prefjob=" + prefjob + ", prefregion=" + prefregion
				+ ", prefemploystatus=" + prefemploystatus + ", preflevelofeducation=" + preflevelofeducation
				+ ", preflastcareer=" + preflastcareer + "]";
	}
	
}
