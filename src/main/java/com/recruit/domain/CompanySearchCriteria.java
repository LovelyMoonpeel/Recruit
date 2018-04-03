package com.recruit.domain;

public class CompanySearchCriteria extends CompanyCriteria {

	private String searchType;
	private String keyword;
	private String orderType;
	
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "CompanySearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", orderType=" + orderType
				+ "]";
	}

	
}