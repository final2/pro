package com.finalproject.model;

public class Product {

	private int no;
	private String name;
	private String maker;
	private int price;
	private String memo;
	private String limiteAge;
	private Event event;
	private SmallCategory smallCat;
	private String image;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getLimiteAge() {
		return limiteAge;
	}
	public void setLimiteAge(String limiteAge) {
		this.limiteAge = limiteAge;
	}
	public Event getEvent() {
		return event;
	}
	public void setEvent(Event event) {
		this.event = event;
	}
	public SmallCategory getSmallCat() {
		return smallCat;
	}
	public void setSmallCat(SmallCategory smallCat) {
		this.smallCat = smallCat;
	}
	
	
}
