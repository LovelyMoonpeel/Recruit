package com.recruit.domain;

public class CodeVO {

	private int id;
	private String career;
	private int tid;
	
	private String v;
	private String w1;
	private String w2;
	private String x;
	private String y;
	private String z;
	
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
	public String getV() {
		return v;
	}
	public void setV(String v) {
		this.v = v;
	}
	public String getW1() {
		return w1;
	}
	public void setW1(String w1) {
		this.w1 = w1;
	}
	public String getW2() {
		return w2;
	}
	public void setW2(String w2) {
		this.w2 = w2;
	}
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	public String getZ() {
		return z;
	}
	public void setZ(String z) {
		this.z = z;
	}
	
	@Override
	public String toString() {
		return "CodeVO [id=" + id + ", career=" + career + ", tid=" + tid + ", v=" + v + ", w1=" + w1 + ", w2=" + w2
				+ ", x=" + x + ", y=" + y + ", z=" + z + "]";
	}
}
