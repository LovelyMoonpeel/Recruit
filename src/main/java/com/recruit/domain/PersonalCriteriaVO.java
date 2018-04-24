package com.recruit.domain;

public class PersonalCriteriaVO {
	
	private String id;
	
	private int page;
	private int perPageNum;
	
	public PersonalCriteriaVO(){
		this.page=1;
		this.perPageNum=10;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	public void setPage(int page){
		if(page<=0){
			this.page=1;
			return;
		}
		this.page=page;
	}
	public void setPerPageNum(int perPageNum){
		if(perPageNum<=0||perPageNum>100){
			this.perPageNum=10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public String getId() {
		return id;
	}
	public int getPage(){
		return page;
	}
	public int getPageStart(){
		return (this.page -1)*perPageNum;
	}
	public int getPerPageNum(){
		return this.perPageNum;
	}
	
	@Override
	public String toString() {
		return "PersonalCriteriaVO [id=" + id + ", page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
}
