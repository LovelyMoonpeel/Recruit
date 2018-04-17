package com.recruit.domain;

public class StatisticVO {

	private String day;
	private Integer weekRecruit;
	private String jobgroup;
	private Integer weekJobgroup;
	private String jobgroup1;
	private String jobgroup2;
	private Integer weekJobgroup2;
	private Integer weekPerson;
	private Integer weekCompany;
	
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public Integer getWeekRecruit() {
		return weekRecruit;
	}
	public void setWeekRecruit(Integer weekRecruit) {
		this.weekRecruit = weekRecruit;
	}
	public String getJobgroup() {
		return jobgroup;
	}
	public void setJobgroup(String jobgroup) {
		this.jobgroup = jobgroup;
	}
	public Integer getWeekJobgroup() {
		return weekJobgroup;
	}
	public void setWeekJobgroup(Integer weekJobgroup) {
		this.weekJobgroup = weekJobgroup;
	}
	public String getJobgroup1() {
		return jobgroup1;
	}
	public void setJobgroup1(String jobgroup1) {
		this.jobgroup1 = jobgroup1;
	}
	public String getJobgroup2() {
		return jobgroup2;
	}
	public void setJobgroup2(String jobgroup2) {
		this.jobgroup2 = jobgroup2;
	}
	public Integer getWeekJobgroup2() {
		return weekJobgroup2;
	}
	public void setWeekJobgroup2(Integer weekJobgroup2) {
		this.weekJobgroup2 = weekJobgroup2;
	}
	public Integer getWeekPerson() {
		return weekPerson;
	}
	public void setWeekPerson(Integer weekPerson) {
		this.weekPerson = weekPerson;
	}
	public Integer getWeekCompany() {
		return weekCompany;
	}
	public void setWeekCompany(Integer weekCompany) {
		this.weekCompany = weekCompany;
	}
	
	@Override
	public String toString() {
		return "StatisticVO [day=" + day + ", weekRecruit=" + weekRecruit + ", jobgroup=" + jobgroup + ", weekJobgroup="
				+ weekJobgroup + ", jobgroup1=" + jobgroup1 + ", jobgroup2=" + jobgroup2 + ", weekJobgroup2="
				+ weekJobgroup2 + ", weekPerson=" + weekPerson + ", weekCompany=" + weekCompany + "]";
	}
	
}
