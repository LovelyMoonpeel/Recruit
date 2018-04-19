package com.recruit.domain;

public class StatisticVO {

	private String day;
	private Integer weekRecruit;
	private String jobgroup;
	private Integer weekJobgroup;
	private String jobgroup1;
	private String rgbname;
	private Integer weekRgb;
	private Integer weekPerson;
	private Integer weekCompany;
	private Integer weekResume;
	private String rJobgroup;		//이력서 직업군
	private Integer weekRJobgroup;	//주간 이력서 직업군
	private String rRgbname;		//이력서 지역
	private Integer weekRRgb;		//이력서 지역 수
	
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
	public String getRgbname() {
		return rgbname;
	}
	public void setRgbname(String rgbname) {
		this.rgbname = rgbname;
	}
	public Integer getWeekRgb() {
		return weekRgb;
	}
	public void setWeekRgb(Integer weekRgb) {
		this.weekRgb = weekRgb;
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
	public Integer getWeekResume() {
		return weekResume;
	}
	public void setWeekResume(Integer weekResume) {
		this.weekResume = weekResume;
	}
	public String getrJobgroup() {
		return rJobgroup;
	}
	public void setrJobgroup(String rJobgroup) {
		this.rJobgroup = rJobgroup;
	}
	public Integer getWeekRJobgroup() {
		return weekRJobgroup;
	}
	public void setWeekRJobgroup(Integer weekRJobgroup) {
		this.weekRJobgroup = weekRJobgroup;
	}
	public String getrRgbname() {
		return rRgbname;
	}
	public void setrRgbname(String rRgbname) {
		this.rRgbname = rRgbname;
	}
	public Integer getWeekRRgb() {
		return weekRRgb;
	}
	public void setWeekRRgb(Integer weekRRgb) {
		this.weekRRgb = weekRRgb;
	}
	
	@Override
	public String toString() {
		return "StatisticVO [day=" + day + ", weekRecruit=" + weekRecruit + ", jobgroup=" + jobgroup + ", weekJobgroup="
				+ weekJobgroup + ", jobgroup1=" + jobgroup1 + ", rgbname=" + rgbname + ", weekRgb=" + weekRgb
				+ ", weekPerson=" + weekPerson + ", weekCompany=" + weekCompany + ", weekResume=" + weekResume
				+ ", rJobgroup=" + rJobgroup + ", weekRJobgroup=" + weekRJobgroup + ", rRgbname=" + rRgbname
				+ ", weekRRgb=" + weekRRgb + "]";
	}
	
}
