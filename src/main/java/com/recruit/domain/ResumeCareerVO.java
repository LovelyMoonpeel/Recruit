package com.recruit.domain;

import java.util.List;

public class ResumeCareerVO {
	
	private int bno;
	private String resumenum;
	private String cname;
	private String jobdescription;
	private String startjob;
	private String finishjob;
	private int salary;
	
	// r.code 03/14 JSP에서 객체 리스트 받기
	private List<ResumeCareerVO> listCareer;

	public List<ResumeCareerVO> getListCareer() {
		return listCareer;
	}

	public void setListCareer(List<ResumeCareerVO> listCareer) {
		this.listCareer = listCareer;
	}
	// end of r.code
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getResumenum() {
		return resumenum;
	}
	public void setResumenum(String resumenum) {
		this.resumenum = resumenum;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getJobdescription() {
		return jobdescription;
	}
	public void setJobdescription(String jobdescription) {
		this.jobdescription = jobdescription;
	}
	public String getStartjob() {
		return startjob;
	}
	public void setStartjob(String startjob) {
		this.startjob = startjob;
	}
	public String getFinishjob() {
		return finishjob;
	}
	public void setFinishjob(String finishjob) {
		this.finishjob = finishjob;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	
	@Override
	public String toString() {
		return "ResumeCareerVO [bno=" + bno + ", resumenum=" + resumenum + ", cname=" + cname + ", jobdescription="
				+ jobdescription + ", startjob=" + startjob + ", finishjob=" + finishjob + ", salary=" + salary + "]";
	}	
	
}
