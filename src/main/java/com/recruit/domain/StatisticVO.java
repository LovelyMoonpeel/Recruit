package com.recruit.domain;

public class StatisticVO {

	private String day;
	private String weekRecruit;
	
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getWeekRecruit() {
		return weekRecruit;
	}
	public void setWeekRecruit(String weekRecruit) {
		this.weekRecruit = weekRecruit;
	}
	@Override
	public String toString() {
		return "StatisticVO [day=" + day + ", weekRecruit=" + weekRecruit + "]";
	}
}
