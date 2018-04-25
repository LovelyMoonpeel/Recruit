package com.recruit.domain;

public class RecruitQnAVO {

	
	private int qnabno;
	private int qbno;
	private int abno;
	private String qtext;
	private String atext;
	private String state;
	private String id;
	private String qtype;
	private String rqtype;
	private int rbno;
	private int connectionbno;
	public int getQnabno() {
		return qnabno;
	}
	public void setQnabno(int qnabno) {
		this.qnabno = qnabno;
	}
	public int getQbno() {
		return qbno;
	}
	public void setQbno(int qbno) {
		this.qbno = qbno;
	}
	public int getAbno() {
		return abno;
	}
	public void setAbno(int abno) {
		this.abno = abno;
	}
	public String getQtext() {
		return qtext;
	}
	public void setQtext(String qtext) {
		this.qtext = qtext;
	}
	public String getAtext() {
		return atext;
	}
	public void setAtext(String atext) {
		this.atext = atext;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQtype() {
		return qtype;
	}
	public void setQtype(String qtype) {
		this.qtype = qtype;
	}
	public String getRqtype() {
		return rqtype;
	}
	public void setRqtype(String rqtype) {
		this.rqtype = rqtype;
	}
	public int getRbno() {
		return rbno;
	}
	public void setRbno(int rbno) {
		this.rbno = rbno;
	}
	public int getConnectionbno() {
		return connectionbno;
	}
	public void setConnectionbno(int connectionbno) {
		this.connectionbno = connectionbno;
	}
	
	@Override
	public String toString() {
		return "RecruitQnAVO [qnabno=" + qnabno + ", qbno=" + qbno + ", abno=" + abno + ", qtext=" + qtext + ", atext="
				+ atext + ", state=" + state + ", id=" + id + ", qtype=" + qtype + ", rqtype=" + rqtype + ", rbno="
				+ rbno + ", connectionbno=" + connectionbno + "]";
	}
	
	

	
}