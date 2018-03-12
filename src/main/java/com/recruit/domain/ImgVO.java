package com.recruit.domain;

public class ImgVO {
	
	private Integer bno;
	private int rid;
	private String imgname;
	
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	
	@Override
	public String toString() {
		return "ImgVO [bno=" + bno + ", rid=" + rid + ", imgname=" + imgname + "]";
	}

}
