package com.recruit.domain;

public class ResumeEduVO {

	private int bno;
	private int resumenum;
	private String schoolname;
	private String major;
	private String enterdate;
	private String gradudate;
	private int sdustatus;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getResumenum() {
		return resumenum;
	}
	public void setResumenum(int resumenum) {
		this.resumenum = resumenum;
	}
	public String getSchoolname() {
		return schoolname;
	}
	public void setSchoolname(String schoolname) {
		this.schoolname = schoolname;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getEnterdate() {
		return enterdate;
	}
	public void setEnterdate(String enterdate) {
		this.enterdate = enterdate;
	}
	public String getGradudate() {
		return gradudate;
	}
	public void setGradudate(String gradudate) {
		this.gradudate = gradudate;
	}
	public int getSdustatus() {
		return sdustatus;
	}
	public void setSdustatus(int sdustatus) {
		this.sdustatus = sdustatus;
	}
	@Override
	public String toString() {
		return "ResumeEduVO [bno=" + bno + ", resumenum=" + resumenum + ", schoolname=" + schoolname + ", major="
				+ major + ", enterdate=" + enterdate + ", gradudate=" + gradudate + ", sdustatus=" + sdustatus + "]";
	}
		
}
