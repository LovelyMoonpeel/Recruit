package com.recruit.domain;

public class CompanySearchCriteria extends CompanyCriteria {

	private String searchType;
	private String pSearchType;
	private String State;
	private String keyword;
	private String pKeyword;
	private String orderType;
	private int bno;

	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getpSearchType() {
		return pSearchType;
	}
	public void setpSearchType(String pSearchType) {
		this.pSearchType = pSearchType;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getpKeyword() {
		return pKeyword;
	}
	public void setpKeyword(String pKeyword) {
		this.pKeyword = pKeyword;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	@Override
	public String toString() {
		return "CompanySearchCriteria [searchType=" + searchType + ", pSearchType=" + pSearchType + ", State=" + State
				+ ", keyword=" + keyword + ", pKeyword=" + pKeyword + ", orderType=" + orderType + ", bno=" + bno + "]";
	}
	
	
}