package com.recruit.domain;

public class CoordinateVO {
	
	private int bno;
	
	private String title;
	private String cid;

	private String v1;
	private String v2;
	private String w1;
	private String w2;
	private String x;
	private String y;
	private String z;
	
	private String distance;

	private String cname; //회사명
	private String periodstart;//공고 시작 기간 periodstart 에서 createdate로 바꿈 //다시 바꿈
	private String period; //공고 마감 기간
	private String acceptmethod; //지원자수
	private String adddesc; // 관리(스크랩 했는지 안했는지)
	
	private String pid;//쓰고 있는 사람 아이디

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getV1() {
		return v1;
	}

	public void setV1(String v1) {
		this.v1 = v1;
	}

	public String getV2() {
		return v2;
	}

	public void setV2(String v2) {
		this.v2 = v2;
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

	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getPeriodstart() {
		return periodstart;
	}

	public void setPeriodstart(String periodstart) {
		this.periodstart = periodstart;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getAcceptmethod() {
		return acceptmethod;
	}

	public void setAcceptmethod(String acceptmethod) {
		this.acceptmethod = acceptmethod;
	}

	public String getAdddesc() {
		return adddesc;
	}

	public void setAdddesc(String adddesc) {
		this.adddesc = adddesc;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	@Override
	public String toString() {
		return "CoordinateVO [bno=" + bno + ", title=" + title + ", cid=" + cid + ", v1=" + v1 + ", v2=" + v2 + ", w1="
				+ w1 + ", w2=" + w2 + ", x=" + x + ", y=" + y + ", z=" + z + ", distance=" + distance + ", cname="
				+ cname + ", periodstart=" + periodstart + ", period=" + period + ", acceptmethod=" + acceptmethod
				+ ", adddesc=" + adddesc + ", pid=" + pid + "]";
	}
	
}
