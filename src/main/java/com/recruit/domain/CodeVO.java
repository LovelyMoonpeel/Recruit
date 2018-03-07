package com.recruit.domain;

public class CodeVO {

	private int id;
	private String career;
	private int tid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	@Override
	public String toString() {
		return "CodeVO [id=" + id + ", career=" + career + ", tid=" + tid + "]";
	}
}
