package com.finalproject.model;

public class ProductSearch {

	private int maker;
	private int smallCat;
	private int eventCode;
	private String limiteAge;
	
	private int beginIndex;
	private int endIndex;
	
	public int getMaker() {
		return maker;
	}
	public void setMaker(int maker) {
		this.maker = maker;
	}
	public int getSmallCat() {
		return smallCat;
	}
	public void setSmallCat(int smallCat) {
		this.smallCat = smallCat;
	}
	public int getEventCode() {
		return eventCode;
	}
	public void setEventCode(int eventCode) {
		this.eventCode = eventCode;
	}
	public String getLimiteAge() {
		return limiteAge;
	}
	public void setLimiteAge(String limiteAge) {
		this.limiteAge = limiteAge;
	}
	public int getBeginIndex() {
		return beginIndex;
	}
	public void setBeginIndex(int beginIndex) {
		this.beginIndex = beginIndex;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	
}
