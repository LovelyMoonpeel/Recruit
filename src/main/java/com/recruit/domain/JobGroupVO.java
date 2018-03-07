package com.recruit.domain;

public class JobGroupVO {

	private int id;
	private String jobgroup;
	private int id2;

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

	@Override
	public String toString() {
		return "JobGroupVO [id=" + id + ", jobgroup=" + jobgroup + ", id2=" + id2 + "]";
	}

}
