package com.recruit.domain;

public class JobGroupVO {

	private int id;
	private String jobgroup;
	private int id2;
	private Integer cut;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getJobgroup() {
		return jobgroup;
	}
	public void setJobgroup(String jobgroup) {
		this.jobgroup = jobgroup;
	}
	public int getId2() {
		return id2;
	}
	public void setId2(int id2) {
		this.id2 = id2;
	}
	public Integer getCut() {
		return cut;
	}
	public void setCut(Integer cut) {
		this.cut = cut;
	}
	@Override
	public String toString() {
		return "JobGroupVO [id=" + id + ", jobgroup=" + jobgroup + ", id2=" + id2 + ", cut=" + cut + "]";
	}

	
}
