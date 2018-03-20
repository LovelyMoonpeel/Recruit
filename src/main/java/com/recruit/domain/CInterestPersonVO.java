package com.recruit.domain;

public class CInterestPersonVO {

	private int presume;
	private String cuserid;
	
	public int getPresume() {
		return presume;
	}
	public void setPresume(int presume) {
		this.presume = presume;
	}
	public String getCuserid() {
		return cuserid;
	}
	public void setCuserid(String cuserid) {
		this.cuserid = cuserid;
	}
	@Override
	public String toString() {
		return "CInterestPersonVO [presume=" + presume + ", cuserid=" + cuserid + "]";
	}
}
